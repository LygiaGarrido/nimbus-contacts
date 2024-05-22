import 'package:flutter/material.dart';

import '../../../utils/app_color_constants.dart';

class NewContactHeader extends StatelessWidget {
  const NewContactHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: appPrimaryColor,
              )),
          const Text(
            'New Contact',
            style: TextStyle(
                color: appPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }
}
