import 'package:mobx/mobx.dart';

part 'error_store.g.dart';

class ErrorStore = _ErrorStoreBase with _$ErrorStore;

abstract class _ErrorStoreBase with Store {
  @observable
  String? errorMsg;

  @observable
  bool loading = false;

  @action
  void setErrorMsg(String msg) {
    errorMsg = msg;
  }

  @action
  void clearErrorMsg() {
    errorMsg = null;
  }
}

final ErrorStore errorStore = ErrorStore();
