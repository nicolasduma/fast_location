// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$addressAtom = Atom(
    name: '_HomeControllerBase.address',
    context: context,
  );

  @override
  AddressModel get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(AddressModel value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$searchAsyncAction = AsyncAction(
    '_HomeControllerBase.search',
    context: context,
  );

  @override
  Future<void> search(String cep) {
    return _$searchAsyncAction.run(() => super.search(cep));
  }

  @override
  String toString() {
    return '''
address: ${address}
    ''';
  }
}
