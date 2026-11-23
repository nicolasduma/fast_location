import 'package:fast_location/src/model/address_model.dart';
import 'package:fast_location/src/model/result_model.dart';

import 'package:fast_location/src/repositories/address_repository.dart';
import 'package:fast_location/src/repositories/address_storage_repository.dart';

class AddressService {
  static AddressRepository addressRepository = AddressRepository();
  static AddressStorageRepository addressStorageRepository =
      AddressStorageRepository();

  Future<ResultModel> get(String cep) async {
    AddressModel? storageAddress = addressStorageRepository.get(cep);

    if (storageAddress != null) {
      return ResultModel(datas: [storageAddress]);
    }

    ResultModel apiResult = await addressRepository.get(cep);

    if (apiResult.isSuccess) {
      addressStorageRepository.save(apiResult.datas[0]);
    }

    return apiResult;
  }
}
