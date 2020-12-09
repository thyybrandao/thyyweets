import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'logo_controller.g.dart';

@Injectable()
class LogoController = _LogoControllerBase with _$LogoController;

abstract class _LogoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
