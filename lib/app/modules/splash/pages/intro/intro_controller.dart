import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'intro_controller.g.dart';

@Injectable()
class IntroController = _IntroControllerBase with _$IntroController;

abstract class _IntroControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
