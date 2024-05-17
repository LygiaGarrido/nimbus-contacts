import 'package:flutter/material.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

import '../texts/contact_texts.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    super.key,
    required this.nameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.isReadOnly,
    required this.onPressedEdit,
    required this.onPressedSave,
    required this.onPressedCancel,
  });

  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final bool isReadOnly;
  final void Function() onPressedEdit;
  final void Function() onPressedCancel;
  final void Function() onPressedSave;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                        onPressed: () {
                          onPressedEdit();
                        },
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
