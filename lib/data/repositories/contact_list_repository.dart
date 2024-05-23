import 'package:nimbus_contacts/data/data_providers/contact_dp.dart';

import '../models/contact_model.dart';

class ContactListRepository {
  ContactDataProvider contactDataProvider = ContactDataProvider();

  Future<List<Contact>> getAllContacts(String userUid) async {
    try {
      List<Contact> contacts =
          await contactDataProvider.getAllContacts(userUid);

      return contacts;
    } catch (e) {
      rethrow;
    }
  }
}
