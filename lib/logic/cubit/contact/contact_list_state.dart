import 'package:equatable/equatable.dart';

import '../../../data/models/contact_model.dart';

abstract class ContactListState extends Equatable {}

class ContactListInitialState extends ContactListState {
  @override
  List<Object> get props => [];
}

class ContactListLoadingState extends ContactListState {
  @override
  List<Object> get props => [];
}

class ContactListLoadedState extends ContactListState {
  final List<Contact> contacts;
  ContactListLoadedState(this.contacts);
  @override
  List<Object> get props => [contacts];
}

class ContactListErrorState extends ContactListState {
  @override
  List<Object> get props => [];
}
