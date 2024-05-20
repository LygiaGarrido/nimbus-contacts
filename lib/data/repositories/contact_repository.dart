import 'package:nimbus_contacts/data/data_providers/contact_dp.dart';

import '../models/contact_model.dart';

class ContactRepository {
  ContactDataProvider contactDataProvider = ContactDataProvider();

  Future<Contact> updateContactById(Contact contact) async {
    var updatedContactData = await contactDataProvider.updateUserByID(contact);
    Contact updatedContact = Contact.fromJson(updatedContactData, contact.id);

    return updatedContact;
  }

  Future addNewContact(Contact contact) async {
    await contactDataProvider.addNewContact(contact);
  }

  Future deleteContactById(String contactId) async {
    await contactDataProvider.deleteUserByID(contactId);
  }
}
