import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/models/contact_model.dart';
import 'package:nimbus_contacts/data/repositories/user_repository.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_state.dart';
import 'package:nimbus_contacts/presentation/screens/contact/texts/contact_texts.dart';
import 'package:nimbus_contacts/presentation/screens/contact/widgets/contact_form.dart';
import 'package:nimbus_contacts/presentation/screens/contact/widgets/more_menu.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';
import 'package:nimbus_contacts/utils/path_constants.dart';

import '../../../utils/utils.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool isReadOnly = true;
  FocusNode nameFocusNode = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggleIsReadOnly() {
    setState(() {
      isReadOnly = !isReadOnly;
      if (isReadOnly) {
        formKey.currentState!.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ContactCubit contactCubit = BlocProvider.of<ContactCubit>(context);
    ContactListCubit contactListCubit =
        BlocProvider.of<ContactListCubit>(context);

    void onTapDelete(String contactId) {
      Utils.showConfirmationDialog(
        context: context,
        icon: Icons.warning_amber_outlined,
        confirmationTitle: deleteDialogTitle,
        confirmationDescription: deleteDialogDescription,
        onTapConfirm: () {
          contactCubit.deleteContactById(contactId);
          Navigator.pop(context);
        },
      );
    }

    return Dialog.fullscreen(
      child: BlocListener<ContactCubit, ContactState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (state is ContactUpdatedSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                Utils.showCustomSnackBar(snackBarUpdateSuccessMessage));
          } else if (state is ContactUpdatedErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(Utils.showCustomSnackBar(snackBarErrorMessage));
          } else if (state is ContactDeletedSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                Utils.showCustomSnackBar(snackBarDeleteSuccessMessage));
            Navigator.pushNamed(context, homePath);
          } else if (state is ContactDeletedErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(Utils.showCustomSnackBar(snackBarErrorMessage));
          }
        },
        child: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, state) {
            if (state is ContactLoadingState) {
              return Utils.showLoading();
            } else if (state is ContactLoadedState) {
              Contact contact = state.contact;
              final TextEditingController nameController =
                  TextEditingController(text: contact.name);
              final TextEditingController phoneNumberController =
                  TextEditingController(text: contact.phoneNumber);
              final TextEditingController emailController =
                  TextEditingController(text: contact.email);
              final TextEditingController tagController =
                  TextEditingController(text: contact.tag);
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      contactListCubit.getAllContacts(UserRepository.user.uid);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: appPrimaryColor),
                  ),
                  title: const Text(
                    contactAppBarTitle,
                    style: TextStyle(color: appPrimaryColor),
                  ),
                  actions: [
                    MoreMenu(
                      onPressed: () => onTapDelete(contact.id),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CircleAvatar(
                          backgroundColor: appSecondaryContainerColor,
                          radius: 50,
                          child: Text(
                            state.contact.name[0].toUpperCase(),
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      ContactForm(
                        formKey: formKey,
                        isReadOnly: isReadOnly,
                        nameController: nameController,
                        phoneNumberController: phoneNumberController,
                        emailController: emailController,
                        tagController: tagController,
                        onPressedEdit: () => toggleIsReadOnly(),
                        onPressedSave: () {
                          Contact contactToUpdate = Contact(
                              contact.id,
                              nameController.text,
                              emailController.text,
                              phoneNumberController.text,
                              tagController.text);
                          if (formKey.currentState!.validate()) {
                            toggleIsReadOnly();
                            contactCubit.updateContactById(contactToUpdate);
                          }
                        },
                        onPressedCancel: () => toggleIsReadOnly(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    contactListCubit.getAllContacts(UserRepository.user.uid);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close, color: appPrimaryColor),
                ),
                title: const Text(
                  contactAppBarTitle,
                  style: TextStyle(color: appPrimaryColor),
                ),
                actions: [
                  MoreMenu(
                    onPressed: () {},
                  )
                ],
              ),
              body: const Center(child: Text('Ops! Something went wrong!')),
            );
          },
        ),
      ),
    );
  }
}
