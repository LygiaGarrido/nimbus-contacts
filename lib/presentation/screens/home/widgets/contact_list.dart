import 'package:flutter/material.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/contact_list_item.dart';

import '../../../../data/models/contact_model.dart';

class ContactList extends StatelessWidget {
  const ContactList(
      {super.key, required this.contacts, required this.onContactTap});
  final List<Contact> contacts;
  final void Function(Contact) onContactTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactListItem(
              title: contacts[index].name,
              onTap: onContactTap,
              contact: contacts[index],
            );
          }),
    );
  }
}
