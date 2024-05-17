import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/repositories/user_repository.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_state.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';
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
              Navigator.pushNamed(context, '/home');
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

void buscarContatos(String userUid) async {
  try {
    // Referência à coleção 'contacts'
    CollectionReference contatosRef =
        FirebaseFirestore.instance.collection('contacts');

    // Obter os documentos da coleção 'contacts'
    QuerySnapshot querySnapshot = await contatosRef
        .where('uid', isEqualTo: userUid)
        .orderBy('name')
        .get();

    // Iterar sobre os documentos e acessar seus dados
    for (var doc in querySnapshot.docs) {
      // Acessar os dados de cada documento
      Map<String, dynamic>? dados = doc.data() as Map<String, dynamic>?;

      // Exemplo de como acessar os valores de campos específicos
      String nome = dados?['name'];
      String telefone = dados?['phoneNumber'];

      // Faça o que precisar com os dados
      print('Nome: $nome, Telefone: $telefone');
    }
  } catch (e) {
    print('Erro ao buscar contatos: $e');
  }
}
