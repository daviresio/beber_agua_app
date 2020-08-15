import 'package:mobx/mobx.dart';
part 'escolher_copo_controller.g.dart';

class EscolherCopoController = _EscolherCopoControllerBase
    with _$EscolherCopoController;

abstract class _EscolherCopoControllerBase with Store {
  @observable
  int cupIndexSelected;

  @action
  selectCup(int value) {
    cupIndexSelected = value;
  }
}
