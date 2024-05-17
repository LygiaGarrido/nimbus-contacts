import 'package:equatable/equatable.dart';

import '../../../data/models/contact_model.dart';

abstract class ContactState extends Equatable {}

class ContactInitialState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoadingState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoadedState extends ContactState {
  final Contact contact;
  ContactLoadedState(this.contact);
  @override
  List<Object> get props => [contact];
}

class ContactUpdatedSuccessState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactUpdatedErrorState extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactErrorState extends ContactState {
  @override
  List<Object> get props => [];
}
