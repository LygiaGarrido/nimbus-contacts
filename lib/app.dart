import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_cubit.dart';
import 'package:nimbus_contacts/presentation/screens/login.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    final UserCubit userCubit = UserCubit();
    return MaterialApp(
      title: 'Nimbus Contacts',
      initialRoute: '/',
      routes: {
        '/': (context) => MultiBlocProvider(
            providers: [BlocProvider.value(value: userCubit)],
            child: const LoginScreen()),
        '/contacts': (context) => const Placeholder()
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
