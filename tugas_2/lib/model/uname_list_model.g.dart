// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uname_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnameListModelAdapter extends TypeAdapter<UnameListModel> {
  @override
  final int typeId = 1;

  @override
  UnameListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnameListModel(
      uname: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UnameListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.uname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnameListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
