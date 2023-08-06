// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GuestModelAdapter extends TypeAdapter<GuestModel> {
  @override
  final int typeId = 1;

  @override
  GuestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GuestModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      surname: fields[2] as String,
      birthday: fields[3] as DateTime,
      phoneNumber: fields[4] as String,
      profession: fields[5] as String,
      recordingDate: fields[6] as DateTime,
      pathToImage: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GuestModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.profession)
      ..writeByte(6)
      ..write(obj.recordingDate)
      ..writeByte(7)
      ..write(obj.pathToImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
