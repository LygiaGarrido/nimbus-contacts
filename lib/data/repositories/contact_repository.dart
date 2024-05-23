import 'package:nimbus_contacts/data/data_providers/contact_dp.dart';

import '../models/contact_model.dart';

class ContactRepository {
  ContactDataProvider contactDataProvider = ContactDataProvider();

  Future<Contact> updateContactById(Contact contact) async {
    try {
      var updatedContactData =
          await contactDataProvider.updateUserByID(contact);
      Contact updatedContact = Contact.fromJson(updatedContactData, contact.id);

      return updatedContact;
    } catch (e) {
      rethrow;
    }
  }

  Future addNewContact(Contact contact) async {
    try {
      await contactDataProvider.addNewContact(contact);
    } catch (e) {
      rethrow;
    }
  }

  Future deleteContactById(String contactId) async {
    try {
      await contactDataProvider.deleteUserByID(contactId);
    } catch (e) {
      rethrow;
    }
  }
}
