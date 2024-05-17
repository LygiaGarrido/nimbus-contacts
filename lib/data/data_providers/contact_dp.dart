import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nimbus_contacts/data/models/contact_model.dart';

class ContactDataProvider {
  CollectionReference contactsRef =
      FirebaseFirestore.instance.collection('contacts');

  Future<List<Contact>> getAllContacts(String userUid) async {
    try {
      QuerySnapshot querySnapshot = await contactsRef
          .where('uid', isEqualTo: userUid)
          .orderBy('name')
          .get();

      List<Contact> contacts = querySnapshot.docs.map((contact) {
        String contactId = contact.id;

        Map<String, dynamic>? contactData =
            contact.data() as Map<String, dynamic>?;

        return Contact.fromJson(contactData, contactId);
      }).toList();

      return contacts;
    } catch (e) {
      rethrow;
    }
  }

  Future updateUserByID(Contact contact) async {
    try {
      DocumentReference docRef = contactsRef.doc(contact.id);
      await docRef.update({
        'name': contact.name,
        'phoneNumber': contact.phoneNumber,
        'email': contact.email
      });

      DocumentSnapshot documentSnapshot = await docRef.get();
      var updatedDocData = documentSnapshot.data();

      return updatedDocData;
    } catch (e) {
      rethrow;
    }
  }
}
