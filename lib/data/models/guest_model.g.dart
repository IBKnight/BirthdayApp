// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GuestModelAdapter extends TypeAdapter<_$_GuestModel> {
  @override
  final int typeId = 1;

  @override
  _$_GuestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GuestModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      surname: fields[2] as String,
      birthday: fields[3] as DateTime,
      phoneNumber: fields[4] as String,
      profession: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_GuestModel obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.profession);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuestModel _$$_GuestModelFromJson(Map<String, dynamic> json) =>
    _$_GuestModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      surname: json['surname'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      phoneNumber: json['phoneNumber'] as String,
      profession: json['profession'] as String,
    );

Map<String, dynamic> _$$_GuestModelToJson(_$_GuestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'birthday': instance.birthday.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'profession': instance.profession,
    };
