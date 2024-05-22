import 'package:flutter/material.dart';
import 'package:nimbus_contacts/presentation/screens/home/widgets/tag_filter_enum.dart';

class DropdownTagMenu extends StatelessWidget {
  const DropdownTagMenu({super.key, required this.tagController});
  final TextEditingController tagController;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<TagsFilter>(
      label: const Text('Tag'),
      controller: tagController,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
      dropdownMenuEntries: TagsFilter.values.map((tag) {
        if (tag == TagsFilter.all) {
          return DropdownMenuEntry(value: tag, label: ' ');
        }
        return DropdownMenuEntry(value: tag, label: tag.name);
      }).toList(),
    );
  }
}
