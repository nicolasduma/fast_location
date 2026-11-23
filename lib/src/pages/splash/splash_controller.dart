import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @observable
  bool isLoading = true;

  @action
  void startApp() {
    Future.delayed(const Duration(seconds: 3), () {
      isLoading = false;
    });
  }
}
