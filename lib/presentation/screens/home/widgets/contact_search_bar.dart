import 'package:flutter/material.dart';

import '../../../../data/models/contact_model.dart';
import '../texts/home_texts.dart';

class ContactSearchBar extends StatelessWidget {
  const ContactSearchBar({
    super.key,
    required this.itemList,
    required this.searchController,
  });

  final List<Contact> itemList;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 1.1,
      child: SearchBar(
        padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
        controller: searchController,
        leading: const Icon(
          Icons.search,
          size: 18,
        ),
        hintText: searchBarHintText,
        hintStyle: const MaterialStatePropertyAll(
          TextStyle(fontStyle: FontStyle.italic),
        ),
        elevation: const MaterialStatePropertyAll(1),
      ),
    );
  }
}
