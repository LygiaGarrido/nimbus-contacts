import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/repositories/user_repository.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserRepository userRepository = UserRepository();

  void login(String email, String password) async {
    try {
      emit(UserLoadingState());
      await userRepository.login(email, password);
      emit(AuthenticatedUserState());
    } catch (e) {
      emit(UserErrorState());
    }
  }
}
