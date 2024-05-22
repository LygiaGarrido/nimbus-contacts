class Contact {
  String id;
  String name;
  String email;
  String phoneNumber;
  String? tag;

  Contact(this.id, this.name, this.email, this.phoneNumber, this.tag);

  factory Contact.fromJson(dynamic contact, String id) {
    return Contact(id, contact['name'] as String, contact['email'] as String,
        contact['phoneNumber'] as String, contact['tag'] as String?);
  }
}
