import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_state.dart';

import '../../../data/models/contact_model.dart';
import '../../../data/repositories/contact_repository.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitialState());

  @override
  void onChange(Change<ContactState> change) {
    debugPrint('from: ${change.currentState}');
    debugPrint('to: ${change.nextState}');
    super.onChange(change);
  }

  ContactRepository contactRepository = ContactRepository();

  void setContact(Contact contact) {
    emit(ContactLoadingState());
    emit(ContactLoadedState(contact));
  }

  void updateContactById(Contact contactToUpdate) async {
    try {
      emit(ContactLoadingState());
      Contact contact =
          await contactRepository.updateContactById(contactToUpdate);
      emit(ContactUpdatedSuccessState());
      emit(ContactLoadedState(contact));
    } catch (e) {
      emit(ContactUpdatedErrorState());
      emit(ContactErrorState());
    }
  }
}
