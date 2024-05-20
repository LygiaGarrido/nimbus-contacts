import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimbus_contacts/logic/cubit/contact/contact_state.dart';

import '../../../data/models/contact_model.dart';
import '../../../data/repositories/contact_repository.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitialState());

  ContactRepository contactRepository = ContactRepository();

  void setContact(Contact contact) {
    emit(ContactLoadingState());
    emit(ContactLoadedState(contact));
  }

  void updateContactById(Contact contactToUpdate) async {
    try {
      emit(ContactLoadingState());
      contactToUpdate.name = contactToUpdate.name.trim()[0].toUpperCase() +
          contactToUpdate.name.substring(1);
      Contact contact =
          await contactRepository.updateContactById(contactToUpdate);
      emit(ContactUpdatedSuccessState());
      emit(ContactLoadedState(contact));
    } catch (e) {
      emit(ContactUpdatedErrorState());
      emit(ContactErrorState());
    }
  }

  void addNewContact(Contact newContact) async {
    try {
      emit(ContactLoadingState());
      newContact.name = newContact.name.trim()[0].toUpperCase() +
          newContact.name.substring(1);
      await contactRepository.addNewContact(newContact);
      emit(ContactCreatedSuccessState());
    } catch (e) {
      emit(ContactCreatedErrorState());
    }
  }

  void deleteContactById(String contactId) async {
    try {
      emit(ContactLoadingState());
      await contactRepository.deleteContactById(contactId);
      emit(ContactDeletedSuccessState());
    } catch (e) {
      emit(ContactDeletedErrorState());
    }
  }
}
