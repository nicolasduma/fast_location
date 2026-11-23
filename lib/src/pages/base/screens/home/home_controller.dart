import 'package:mobx/mobx.dart';

import 'package:fast_location/src/model/address_model.dart';
import 'package:fast_location/src/services/AddressService.dart';
import 'package:fast_location/src/store/error_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase({AddressService? addressService})
    : _addressService = addressService ?? AddressService();

  final AddressService _addressService;

  @observable
  AddressModel address = AddressModel();

  String? validateCep(String? value) {
    final cep = value?.trim() ?? '';
    if (!RegExp(r'^\d{8}$').hasMatch(cep)) {
      return 'CEP inválido, digite 8 dígitos';
    }

    if (cep == '00000000') {
      return 'CEP inválido';
    }

    return null;
  }

  @action
  Future<void> search(String cep) async {
    address = AddressModel();

    final result = await _addressService.get(cep);
    if (result.isSuccess) {
      address = result.datas.first;
    } else {
      errorStore.setErrorMsg(result.errorMsg);
    }
  }
}
