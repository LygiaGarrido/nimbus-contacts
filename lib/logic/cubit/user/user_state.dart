import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class AuthenticatedUserState extends UserState {
  @override
  List<Object> get props => [];
}

class NewUserState extends UserState {
  @override
  List<Object> get props => [];
}

class UserErrorState extends UserState {
  @override
  List<Object> get props => [];
}
