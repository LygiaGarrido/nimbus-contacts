import 'package:flutter/material.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';
import 'package:nimbus_contacts/utils/widgets/dropdown_tag_menu.dart';

import '../texts/contact_texts.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.tagController,
    required this.isReadOnly,
    required this.onPressedEdit,
    required this.onPressedSave,
    required this.onPressedCancel,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController tagController;
  final bool isReadOnly;
  final void Function() onPressedEdit;
  final void Function() onPressedCancel;
  final void Function() onPressedSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                controller: nameController,
                readOnly: isReadOnly,
                validator: (value) {
                  if (!isReadOnly) {
                    if (value!.isEmpty) {
                      return noNameProvided;
                    }
                  }
                  return null;
                },
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.person_2_outlined,
                    color: appPrimaryColor,
                  ),
                  filled: !isReadOnly,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                controller: phoneNumberController,
                readOnly: isReadOnly,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.phone,
                    color: appPrimaryColor,
                  ),
                  filled: !isReadOnly,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                controller: emailController,
                readOnly: isReadOnly,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.alternate_email,
                    color: appPrimaryColor,
                  ),
                  filled: !isReadOnly,
                ),
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
            !isReadOnly
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.sell_outlined,
                          color: appPrimaryColor,
                        ),
                        DropdownTagMenu(tagController: tagController),
                        const SizedBox()
                      ],
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: TextFormField(
                      controller: tagController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.sell_outlined,
                          color: appPrimaryColor,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isReadOnly
                    ? const SizedBox()
                    : TextButton(
                        onPressed: onPressedCancel,
                        child: const Text(cancelBtnText),
                      ),
                const SizedBox(
                  width: 10,
                ),
                !isReadOnly
                    ? FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color?>(
                              appSecondaryContainerColor),
                        ),
                        onPressed: onPressedSave,
                        child: const Text(
                          saveBtnText,
                          style:
                              TextStyle(fontSize: 16, color: appPrimaryColor),
                        ),
                      )
                    : TextButton(
                        onPressed: onPressedEdit,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              editBtnText,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.edit,
                              size: 16,
                            )
                          ],
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
