import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/models/contact_model.dart';
import 'package:nimbus_contacts/data/repositories/user_repository.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_cubit.dart';
import 'package:nimbus_contacts/presentation/screens/new_contact/widgets/new_contact_form.dart';
import 'package:nimbus_contacts/presentation/screens/new_contact/widgets/new_contact_header.dart';

import '../../../logic/cubit/contact/contact_cubit.dart';

class NewContactDialog {
  static Future showNewContactDialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    ContactCubit contactCubit = BlocProvider.of<ContactCubit>(context);
    ContactListCubit contactListCubit =
        BlocProvider.of<ContactListCubit>(context);

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: height / 1.7,
              width: width,
              padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const NewContactHeader(),
                    NewContactForm(
                        nameController: nameController,
                        phoneNumberController: phoneNumberController,
                        emailController: emailController,
                        onPressedSave: () {
                          contactCubit.addNewContact(Contact(
                              '',
                              nameController.text,
                              emailController.text,
                              phoneNumberController.text));
                          contactListCubit
                              .getAllContacts(UserRepository.user.uid);
                          Navigator.pop(context);
                        },
                        onPressedCancel: () => Navigator.pop(context))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
