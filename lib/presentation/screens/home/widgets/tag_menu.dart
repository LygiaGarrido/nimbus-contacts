import 'package:flutter/material.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/tag_filter_enum.dart';

import '../../../../utils/app_color_constants.dart';

class TagMenu extends StatelessWidget {
  const TagMenu({super.key, required this.onPressed});
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(-30, 0),
      menuChildren: [
        MenuItemButton(
          onPressed: () => onPressed(TagsFilter.all.name),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: appSecondaryColor,
                radius: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  TagsFilter.all.name,
                ),
              ),
            ],
          ),
        ),
        MenuItemButton(
          onPressed: () => onPressed(TagsFilter.family.name),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: familyTagColor,
                radius: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  TagsFilter.family.name,
                ),
              ),
            ],
          ),
        ),
        MenuItemButton(
          onPressed: () => onPressed(TagsFilter.friends.name),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: friendsTagColor,
                radius: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  TagsFilter.friends.name,
                ),
              ),
            ],
          ),
        ),
        MenuItemButton(
          onPressed: () => onPressed(TagsFilter.work.name),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: workTagColor,
                radius: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  TagsFilter.work.name,
                ),
              ),
            ],
          ),
        ),
      ],
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return TextButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(Icons.style_outlined),
        );
      },
    );
  }
}
