import 'package:flutter/material.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

import '../texts/new_user_texts.dart';

class NewUserForm extends StatefulWidget {
  const NewUserForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.onSignUpButtonPressed})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final Function() onSignUpButtonPressed;
  @override
  State<NewUserForm> createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {
  bool showPassword = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 3.2,
      width: width / 1.2,
      decoration: const BoxDecoration(
        color: appBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: widget.emailController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return noEmailText;
                  }

                  return null;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor),
                  ),
                  labelText: emailFormLabelText,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onFieldSubmitted: (value) => widget.onSignUpButtonPressed(),
                controller: widget.passwordController,
                focusNode: passwordFocusNode,
                obscureText: !showPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return noPasswordText;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor),
                  ),
                  labelText: passwordFormLabelText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height < 670 ? 10 : height / 20,
              ),
              ElevatedButton(
                onPressed: widget.onSignUpButtonPressed,
                child: const Text(joinBtnText),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
