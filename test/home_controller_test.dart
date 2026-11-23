import 'package:flutter_test/flutter_test.dart';

import 'package:fast_location/src/model/result_model.dart';
import 'package:fast_location/src/pages/base/screens/home/home_controller.dart';
import 'package:fast_location/src/services/AddressService.dart';

class _UnusedAddressService extends AddressService {
  @override
  Future<ResultModel> get(String cep) async => ResultModel();
}

void main() {
  late HomeController controller;

  setUp(() {
    controller = HomeController(addressService: _UnusedAddressService());
  });

  test('rejects CEPs that do not contain exactly eight digits', () {
    expect(controller.validateCep(null), isNotNull);
    expect(controller.validateCep('1234567'), isNotNull);
    expect(controller.validateCep('1234abcd'), isNotNull);
  });

  test('rejects the all-zero CEP', () {
    expect(controller.validateCep('00000000'), 'CEP inválido');
  });

  test('accepts an eight-digit CEP that is not all zeroes', () {
    expect(controller.validateCep('01001000'), isNull);
  });
}
