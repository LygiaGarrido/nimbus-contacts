import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/repositories/user_repository.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_state.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';
import 'package:nimbus_contacts/utils/path_constants.dart';
import 'package:nimbus_contacts/utils/utils.dart';

import 'texts/texts.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    ContactListCubit contactListCubit =
        BlocProvider.of<ContactListCubit>(context);

    void onLoginButtonClicked() {
      if (formKey.currentState!.validate()) {
        userCubit.login(emailController.text, passwordController.text);
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColor,
        body: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoadingState) {
              Utils.showLoadingAlert(context);
            } else if (state is UserErrorState) {
              Navigator.pop(context);
              Utils.showErrorDialog(context, Icons.warning_amber_rounded,
                  errorTitleText, errorDescriptionText);
            } else if (state is AuthenticatedUserState) {
              contactListCubit.getAllContacts(UserRepository.user.uid);
              Navigator.pushNamed(context, homePath);
            }
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Expanded(
                  flex: 0,
                  child: Image.asset(
                    logoImagePath,
                    height: 150,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: LoginForm(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    onSendButtonPressed: () => onLoginButtonClicked(),
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
