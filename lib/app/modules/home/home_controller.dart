import 'package:beber_agua/app/data/models/bebidas_join.dart';
import 'package:beber_agua/app/data/models/config.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  Config config;

  @observable
  var bebida;

  @observable
  int currentValue = 0;

  @action
  void initConfig(config, bebida) {
    print(config.toString());
    print(bebida.toString());
    this.config = config;
    this.bebida = bebida;
  }

  @observable
  List<dynamic> bebidasIngeridasHoje;

  @action
  setBebidasIngeridasHoje(List<BebidaComBebidaIngerida> v) {
    this.bebidasIngeridasHoje = List<BebidaComBebidaIngerida>.from(v);
  }

  @computed
  int get totalIngeridoHoje {
    if (bebidasIngeridasHoje == null) return 0;
    int total = bebidasIngeridasHoje.fold(0, (acc, cur) => acc + cur.bebida.ml);
    return total;
  }
}
