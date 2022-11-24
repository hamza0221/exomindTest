import 'package:exomind_test/view/start_screen.dart';

abstract class StartRouter {
  void displayWeatherScreen(bool val);
}

class StartViewModel extends IStartViewModel {
  final StartRouter _startRouter;

  StartViewModel(this._startRouter);

  @override
  void displayWeatherScreen(bool val) {
    _startRouter.displayWeatherScreen(val);
  }
}
