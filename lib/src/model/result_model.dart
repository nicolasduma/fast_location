import 'package:fast_location/src/model/address_model.dart';

class ResultModel {
  bool isSuccess;
  bool isFailure;
  String errorMsg;
  List<AddressModel> datas = [];

  ResultModel({
    this.isSuccess = true,
    this.datas = const [],
    this.errorMsg = "",
  }) : isFailure = !isSuccess;
}
