import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_list_state.dart';

import '../../../data/models/contact_model.dart';
import '../../../data/repositories/contact_list_repository.dart';

class ContactListCubit extends Cubit<ContactListState> {
  ContactListCubit() : super(ContactListInitialState());
  @override
  void onChange(Change<ContactListState> change) {
    debugPrint('from: ${change.currentState}');
    debugPrint('to: ${change.nextState}');
    super.onChange(change);
  }

  ContactListRepository contactListRepository = ContactListRepository();

  getAllContacts(String userUid) async {
    try {
      emit(ContactListLoadingState());
      List<Contact> contacts =
          await contactListRepository.getAllContacts(userUid);
      emit(ContactListLoadedState(contacts));
    } catch (e) {
      emit(ContactListErrorState());
    }
  }
}
