// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordListModelAdapter extends TypeAdapter<PasswordListModel> {
  @override
  final int typeId = 1;

  @override
  PasswordListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordListModel(
      password: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
