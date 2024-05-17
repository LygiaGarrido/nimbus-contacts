import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_cubit.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_cubit.dart';
import 'package:nimbus_contacts/presentation/screens/contact/contact_screen.dart';
import 'package:nimbus_contacts/presentation/screens/home/home_screen.dart';
import 'package:nimbus_contacts/presentation/screens/login/login.dart';
import 'package:nimbus_contacts/utils/app_color_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    final UserCubit userCubit = UserCubit();
    final ContactListCubit contactListCubit = ContactListCubit();
    final ContactCubit contactCubit = ContactCubit();
    return MaterialApp(
      title: 'Nimbus Contacts',
      initialRoute: '/',
      routes: {
        '/': (context) => MultiBlocProvider(providers: [
              BlocProvider.value(value: userCubit),
              BlocProvider.value(value: contactListCubit)
            ], child: const LoginScreen()),
        '/home': (context) => MultiBlocProvider(providers: [
              BlocProvider.value(value: userCubit),
              BlocProvider.value(value: contactListCubit),
              BlocProvider.value(value: contactCubit),
            ], child: const HomeScreen()),
        '/contact': (context) => MultiBlocProvider(providers: [
              BlocProvider.value(value: userCubit),
              BlocProvider.value(value: contactListCubit),
              BlocProvider.value(value: contactCubit)
            ], child: const ContactScreen())
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
