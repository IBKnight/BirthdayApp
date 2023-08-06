class GuestEntity {
  final int? id;
  final String name;
  final String surname;
  final DateTime birthday;
  final String phoneNumber;
  final String profession;
  final DateTime recordingDate;
  final String? pathToImage;

  GuestEntity(this.name, this.surname, this.birthday, this.phoneNumber,
      this.profession, this.recordingDate, {this.id, this.pathToImage});
}
