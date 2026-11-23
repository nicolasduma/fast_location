// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ErrorStore on _ErrorStoreBase, Store {
  late final _$errorMsgAtom = Atom(
    name: '_ErrorStoreBase.errorMsg',
    context: context,
  );

  @override
  String? get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String? value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$loadingAtom = Atom(
    name: '_ErrorStoreBase.loading',
    context: context,
  );

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_ErrorStoreBaseActionController = ActionController(
    name: '_ErrorStoreBase',
    context: context,
  );

  @override
  void setErrorMsg(String msg) {
    final _$actionInfo = _$_ErrorStoreBaseActionController.startAction(
      name: '_ErrorStoreBase.setErrorMsg',
    );
    try {
      return super.setErrorMsg(msg);
    } finally {
      _$_ErrorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearErrorMsg() {
    final _$actionInfo = _$_ErrorStoreBaseActionController.startAction(
      name: '_ErrorStoreBase.clearErrorMsg',
    );
    try {
      return super.clearErrorMsg();
    } finally {
      _$_ErrorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMsg: ${errorMsg},
loading: ${loading}
    ''';
  }
}
