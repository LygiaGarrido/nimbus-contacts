import 'package:flutter/material.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

class NewContactForm extends StatelessWidget {
  const NewContactForm({
    super.key,
    required this.nameController,
    required this.phoneNumberController,
    required this.emailController,
    required this.onPressedSave,
    required this.onPressedCancel,
  });

  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;

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
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: appPrimaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  icon: Icon(
                    Icons.phone,
                    color: appPrimaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.alternate_email,
                    color: appPrimaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onPressedCancel,
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FilledButton(
                      onPressed: onPressedSave, child: const Text('Save'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
