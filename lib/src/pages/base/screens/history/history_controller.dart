import 'package:mobx/mobx.dart';

import 'package:fast_location/src/model/address_model.dart';
import 'package:fast_location/src/repositories/address_storage_repository.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  _HistoryControllerBase({AddressStorageRepository? storageRepository})
    : _storageRepository = storageRepository ?? AddressStorageRepository();

  final AddressStorageRepository _storageRepository;

  @observable
  List<AddressModel> addresses = [];

  @action
  void load() {
    addresses = _storageRepository.getAll();
  }
}
