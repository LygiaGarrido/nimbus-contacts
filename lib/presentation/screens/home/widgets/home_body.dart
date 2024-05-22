import 'package:flutter/material.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/contact_list.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/contact_search_bar.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/tag_menu.dart';

import '../../../../data/models/contact_model.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.searchController,
    required this.allContactsList,
    required this.searchedItemList,
    required this.onContactTap,
    required this.onTagMenuPressed,
  });
  final TextEditingController searchController;
  final List<Contact> allContactsList;
  final List<Contact> searchedItemList;
  final void Function(Contact) onContactTap;
  final void Function(String) onTagMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ContactSearchBar(
                    itemList: allContactsList,
                    searchController: searchController,
                  ),
                ),
              ),
              TagMenu(onPressed: onTagMenuPressed)
            ],
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
