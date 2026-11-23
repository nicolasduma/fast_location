import 'package:geocoding/geocoding.dart' as geo;
import 'package:map_launcher/map_launcher.dart';

import 'package:fast_location/src/model/address_model.dart';

import 'package:fast_location/src/store/error_store.dart';

class AddressDetailsController {
  static Future<void> launchMap(AddressModel address) async {
    final geo.Geocoding geocoding = geo.Geocoding();
    try {
      final searchTerm = address.street.isNotEmpty
          ? '${address.street}, ${address.cep}, Brasil'
          : '${address.cep}, Brasil';

      final List<geo.Location> locations = await geocoding.locationFromAddress(
        searchTerm,
      );

      if (locations.isEmpty) {
        errorStore.setErrorMsg(
          'Não foi possível encontrar coordenadas para este CEP.',
        );
        return;
      }

      final location = LocationCoords(
        locations.first.latitude,
        locations.first.longitude,
        title: 'CEP: ${address.cep}',
      );

      final marker = MapLauncher.marker(location);
      final availableMaps = await marker.getSupportedMaps([
        MapApp.google,
        MapApp.waze,
        MapApp.apple,
        MapApp.here,
        MapApp.doubleGis,
      ]);

      if (availableMaps.isEmpty) {
        errorStore.setErrorMsg(
          'Nenhum aplicativo de mapa instalado no aparelho.',
        );
        return;
      }

      await availableMaps.first.show();
    } catch (e) {
      errorStore.setErrorMsg('Erro ao abrir o mapa.');
    }
  }
}
