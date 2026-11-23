import 'package:hive_ce_flutter/hive_ce_flutter.dart';

part 'address_model.g.dart';

@HiveType(typeId: 0)
class AddressModel {
  @HiveField(0)
  String cep;

  @HiveField(1)
  String street;

  @HiveField(2)
  String neighborhoodOrDistrict;

  @HiveField(3)
  String cityWithItsFederativeUnit;

  AddressModel({
    this.cep = "",
    this.street = "",
    this.neighborhoodOrDistrict = "",
    this.cityWithItsFederativeUnit = "",
  });
}
