class GuestEntity {
  final int? id;
  final String name;
  final String surname;
  final DateTime birthday;
  final String phoneNumber;
  final String profession;

  GuestEntity(this.name, this.surname, this.birthday, this.phoneNumber,
      this.profession, {this.id});
}
