import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/data/data_provider/user_dp.dart';
import 'package:nimbus_contacts/logic/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserDataProvider userDataProvider = UserDataProvider();

  void login(String email, String password) async {
    try {
      emit(UserLoadingState());
      await userDataProvider.login(email, password);
      emit(AuthenticatedUserState());
    } catch (e) {
      emit(UserErrorState());
    }
  }
}
