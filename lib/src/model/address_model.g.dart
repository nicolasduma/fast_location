// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final typeId = 0;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      cep: fields[0] == null ? "" : fields[0] as String,
      street: fields[1] == null ? "" : fields[1] as String,
      neighborhoodOrDistrict: fields[2] == null ? "" : fields[2] as String,
      cityWithItsFederativeUnit: fields[3] == null ? "" : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cep)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.neighborhoodOrDistrict)
      ..writeByte(3)
      ..write(obj.cityWithItsFederativeUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
