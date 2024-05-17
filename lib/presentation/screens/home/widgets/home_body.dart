import 'package:flutter/material.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/contact_list.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/contact_search_bar.dart';

import '../../../../data/models/contact_model.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.searchController,
    required this.allContactsList,
    required this.searchedItemList,
    required this.onContactTap,
  });
  final TextEditingController searchController;
  final List<Contact> allContactsList;
  final List<Contact> searchedItemList;
  final void Function(Contact) onContactTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ContactSearchBar(
            itemList: allContactsList,
            searchController: searchController,
          ),
        ),
        Flexible(
          child: ContactList(
            contacts: searchedItemList,
            onContactTap: onContactTap,
          ),
        )
      ],
    );
  }
}
