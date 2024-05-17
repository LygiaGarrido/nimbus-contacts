class Contact {
  String id;
  String name;
  String email;
  String phoneNumber;

  Contact(this.id, this.name, this.email, this.phoneNumber);

  factory Contact.fromJson(dynamic contact, String id) {
    return Contact(
      id,
      contact['name'] as String,
      contact['email'] as String,
      contact['phoneNumber'] as String,
    );
  }
}
