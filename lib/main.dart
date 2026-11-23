import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:fast_location/src/model/address_model.dart';

import 'package:fast_location/src/store/error_store.dart';

import 'package:fast_location/src/shared/routes.dart';
import 'package:fast_location/src/shared/storage.dart';
import 'package:fast_location/src/shared/colors.dart' as app_colors;

import 'package:fast_location/src/pages/splash/splash_page.dart';
import 'package:fast_location/src/pages/base/base_page.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AddressModelAdapter());
  await Hive.openBox<AddressModel>(Storage.databaseBox);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) {
        return reaction<String?>((_) => errorStore.errorMsg, (msg) {
          if (msg != null && msg.isNotEmpty) {
            snackbarKey.currentState?.hideCurrentSnackBar();
            snackbarKey.currentState?.showSnackBar(
              SnackBar(
                content: Text(msg),
                backgroundColor: app_colors.Colors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
            errorStore.clearErrorMsg();
          }
        });
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashPage,
        scaffoldMessengerKey: snackbarKey,
        routes: {
          Routes.splashPage: (context) => SplashPage(),
          Routes.basePage: (context) => BasePage(),
        },
      ),
    );
  }
}
