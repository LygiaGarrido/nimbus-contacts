import 'package:flutter/material.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';
import 'package:email_validator/email_validator.dart';

import '../texts/texts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.onSendButtonPressed})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final Function() onSendButtonPressed;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPassword = false;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 3,
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
                    return noEmailFormText;
                  }
                  final bool isEmailValid = EmailValidator.validate(value);
                  if (!isEmailValid) {
                    return invalidEmailFormText;
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
                  labelText: emailFormText,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onFieldSubmitted: (value) => widget.onSendButtonPressed(),
                controller: widget.passwordController,
                focusNode: passwordFocusNode,
                obscureText: !showPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return noPasswordFormText;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: appPrimaryColor),
                  ),
                  labelText: passwordFormText,
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
                onPressed: widget.onSendButtonPressed,
                child: const Text(signInBtnText),
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
