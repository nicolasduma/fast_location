import 'package:dio/dio.dart';

import 'package:fast_location/src/http/http_via_cep.dart';
import 'package:fast_location/src/model/address_model.dart';
import 'package:fast_location/src/model/result_model.dart';

class AddressRepository {
  Future<ResultModel> get(String cep) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: HttpViaCep.generateUrl(cep),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    try {
      final response = await dio.get("");

      if (response.statusCode == 200) {
        final apiResult = response.data;

        if (apiResult['erro'] == true || apiResult['erro'] == 'true') {
          return ResultModel(isSuccess: false, errorMsg: "CEP não encontrado.");
        }

        return ResultModel(
          datas: [
            AddressModel(
              cep: cep,
              street: apiResult["logradouro"] ?? "",
              neighborhoodOrDistrict: apiResult["bairro"] ?? "",
              cityWithItsFederativeUnit:
                  "${apiResult['localidade']} - ${apiResult['uf']}",
            ),
          ],
        );
      }
    } on DioException {
      return ResultModel(
        isSuccess: false,
        errorMsg: "Houve um erro na consulta.",
      );
    }

    return ResultModel(
      isSuccess: false,
      errorMsg: "Houve um erro na consulta.",
    );
  }
}
