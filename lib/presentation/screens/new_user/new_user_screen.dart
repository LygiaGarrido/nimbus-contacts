import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_state.dart';
import 'package:nimbus_contacts/presentation/screens/new_user/texts/new_user_texts.dart';
import 'package:nimbus_contacts/presentation/screens/new_user/widgets/new_user_form.dart';

import '../../utils/app_color_constants.dart';
import '../../utils/path_constants.dart';
import '../../utils/utils.dart';
import '../login/texts/texts.dart';

class NewUserScreen extends StatelessWidget {
  const NewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    UserCubit userCubit = BlocProvider.of<UserCubit>(context);

    void onSignUpButtonClicked() {
      if (formKey.currentState!.validate()) {
        userCubit.addNewUser(emailController.text, passwordController.text);
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
            } else if (state is NewUserState) {
              Navigator.pushNamed(context, initialPath);
            }
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: appBackgroundColor,
                        )),
                    const Text(
                      topPageText,
                      style: TextStyle(
                        color: appBackgroundColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    )
                  ],
                ),
                Expanded(
                  flex: 0,
                  child: Image.asset(
                    logoImagePath,
                    height: 150,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: NewUserForm(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    onSignUpButtonPressed: () => onSignUpButtonClicked(),
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
