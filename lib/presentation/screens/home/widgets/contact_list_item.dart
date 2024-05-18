import 'package:flutter/material.dart';
import 'package:nimbus_contacts/presentation/screens/home/texts/home_texts.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

import '../../../../data/models/contact_model.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem(
      {super.key,
      required this.title,
      required this.onTap,
      required this.contact});
  final String title;
  final Contact contact;
  final void Function(Contact) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: appSecondaryColor,
        child: Text(
          title == emptyContactText ? '!' : title[0].toUpperCase(),
          style: const TextStyle(color: appYellowColor),
        ),
      ),
      title: Text(title),
      onTap: () => onTap(contact),
    );
  }
}
