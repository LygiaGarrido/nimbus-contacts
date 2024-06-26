import 'package:flutter/material.dart';

import '../../../utils/app_color_constants.dart';
import '../texts/contact_texts.dart';

class MoreMenu extends StatelessWidget {
  const MoreMenu({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(-30, 0),
      menuChildren: [
        MenuItemButton(
          onPressed: onPressed,
          child: Text(
            deleteBtnText,
            style: TextStyle(color: appErrorColor, fontSize: 16),
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
          child: const Icon(Icons.more_vert),
        );
      },
    );
  }
}
