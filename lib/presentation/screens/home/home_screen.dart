import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/models/contact_model.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_state.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_state.dart';
import 'package:nimbus_contacts/presentation/screens/home/texts/home_texts.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/home_body.dart';
import 'package:nimbus_contacts/presentation/screens/new_contact/new_contact_dialog.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';
import 'package:nimbus_contacts/utils/utils.dart';

import '../../../data/repositories/user_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> allItems = [];
  List<Contact> items = [];
  final TextEditingController searchController = TextEditingController();
  final Contact emptyContact = Contact('', emptyContactText, '', '');

  @override
  Widget build(BuildContext context) {
    ContactCubit contactCubit = BlocProvider.of<ContactCubit>(context);

    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        if (state is ContactCreatedSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              Utils.showCustomSnackBar('You have added a new contact!'));
        } else if (state is ContactCreatedErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(Utils.showCustomSnackBar(
              'Something went wrong, please try again!'));
        }
      },
      child: BlocBuilder<ContactListCubit, ContactListState>(
        builder: (context, state) {
          if (state is ContactListLoadingState) {
            return Utils.showLoading();
          } else if (state is ContactListLoadedState) {
            allItems = state.contacts;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: appPrimaryColor,
                title: const Text(
                  appBarTitle,
                  style: TextStyle(color: appYellowColor),
                ),
                automaticallyImplyLeading: false,
              ),
              body: HomeBody(
                searchController: searchController,
                allContactsList: allItems,
                searchedItemList: items.isEmpty ? allItems : items,
                onContactTap: (value) {
                  if (value != emptyContact) {
                    contactCubit.setContact(value);
                    Navigator.pushNamed(context, '/contact');
                  }
                },
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: appPrimaryColor,
                onPressed: () => NewContactDialog.showNewContactDialog(context),
                child: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: appYellowColor,
                ),
              ),
            );
          } else {
            return const Text('Oops, something happened...');
          }
        },
      ),
    );
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems
            .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        if (items.isEmpty) {
          items.add(emptyContact);
        }
      });
    }
  }

  void queryListener() {
    search(searchController.text);
  }

  @override
  void initState() {
    super.initState();
    ContactListCubit contactListCubit =
        BlocProvider.of<ContactListCubit>(context);
    contactListCubit.getAllContacts(UserRepository.user.uid);
    searchController.addListener(queryListener);
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }
}
