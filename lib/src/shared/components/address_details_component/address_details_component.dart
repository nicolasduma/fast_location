import 'package:fast_location/src/model/address_model.dart';
import 'package:fast_location/src/shared/components/address_details_component/address_details_controller.dart';
import 'package:flutter/material.dart';

import 'package:fast_location/src/shared/metrics.dart';
import 'package:fast_location/src/shared/components/result_card_component/result_card_component.dart';

class AddressDetailsComponent extends StatelessWidget {
  const AddressDetailsComponent({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Metrics.itemSpacing,
        children: [
          if (address.cep.isNotEmpty)
            ResultCardComponent(title: "CEP", info: address.cep),
          if (address.street.isNotEmpty)
            ResultCardComponent(title: "Logradouro", info: address.street),
          if (address.neighborhoodOrDistrict.isNotEmpty)
            ResultCardComponent(
              title: "Distrito/Bairro",
              info: address.neighborhoodOrDistrict,
            ),
          if (address.cityWithItsFederativeUnit.isNotEmpty)
            ResultCardComponent(
              title: "Cidade/UF",
              info: address.cityWithItsFederativeUnit,
            ),
          if (address.cep.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                AddressDetailsController.launchMap(address);
              },
              child: Text("Ver no mapa"),
            ),
        ],
      ),
    );
  }
}
