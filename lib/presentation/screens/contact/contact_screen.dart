import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/models/contact_model.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_state.dart';
import 'package:nimbus_contacts/presentation/screens/contact/texts/contact_texts.dart';
import 'package:nimbus_contacts/presentation/screens/contact/widgets/contact_form.dart';
import 'package:nimbus_contacts/presentation/screens/contact/widgets/more_menu.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

import '../../../utils/utils.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool isReadOnly = true;
  FocusNode nameFocusNode = FocusNode();

  void toggleIsReadOnly() {
    setState(() {
      isReadOnly = !isReadOnly;
    });
  }

  @override
  Widget build(BuildContext context) {
    ContactCubit contactCubit = BlocProvider.of<ContactCubit>(context);

    return Dialog.fullscreen(
      child: BlocListener<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactUpdatedSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(Utils.showCustomSnackBar(toastSuccessMessage));
          } else if (state is ContactUpdatedErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(Utils.showCustomSnackBar(toastErrorMessage));
          }
        },
        child: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, state) {
            if (state is ContactLoadingState) {
              return Utils.showLoading();
            } else if (state is ContactLoadedState) {
              Contact contact = state.contact;
              final TextEditingController nameController =
                  TextEditingController(text: contact.name);
              final TextEditingController phoneNumberController =
                  TextEditingController(text: contact.phoneNumber);
              final TextEditingController emailController =
                  TextEditingController(text: contact.email);
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: appPrimaryColor),
                  ),
                  title: const Text(
                    contactAppBarTitle,
                    style: TextStyle(color: appPrimaryColor),
                  ),
                  actions: [
                    MoreMenu(
                      onPressed: () => print('delete'),
                    )
                  ],
                ),
                body: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CircleAvatar(
                          backgroundColor: appSecondaryContainerColor,
                          radius: 50,
                          child: Text(
                            state.contact.name[0].toUpperCase(),
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      ContactForm(
                        isReadOnly: isReadOnly,
                        nameController: nameController,
                        phoneNumberController: phoneNumberController,
                        emailController: emailController,
                        onPressedEdit: () => toggleIsReadOnly(),
                        onPressedSave: () {
                          Contact contactToUpdate = Contact(
                              contact.id,
                              nameController.text,
                              emailController.text,
                              phoneNumberController.text);

                          toggleIsReadOnly();

                          contactCubit.updateContactById(contactToUpdate);
                        },
                        onPressedCancel: () => toggleIsReadOnly(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
