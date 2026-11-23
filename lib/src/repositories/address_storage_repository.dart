import 'package:hive_ce/hive_ce.dart';

import 'package:fast_location/src/model/address_model.dart';

import 'package:fast_location/src/shared/storage.dart';

class AddressStorageRepository {
  final Box<AddressModel> box = Hive.box<AddressModel>(Storage.databaseBox);

  void save(AddressModel address) {
    box.put(address.cep, address);
  }

  AddressModel? get(String cep) {
    return box.get(cep);
  }

  List<AddressModel> getAll() {
    return box.values.cast<AddressModel>().toList();
  }
}
