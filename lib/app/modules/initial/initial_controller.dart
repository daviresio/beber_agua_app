import 'package:beber_agua/app/data/models/config.dart';
import 'package:mobx/mobx.dart';

part 'initial_controller.g.dart';

class InitialController = _InitialBase with _$InitialController;

abstract class _InitialBase with Store {

  @observable
  Config config = Config(sexo: 'M', peso: 70, horaAcordar: 6, minutoAcordar: 0, horaDormir: 22, minutoDormir: 0, copoSelecionadoId: 1);

  @action setSexo(v) {
    config = config.copyWith(sexo: v, peso: (v == 'M' ? 70 : 60));
  }

  @action setPeso(v) {
    config = config.copyWith(peso: v);
  }

  @action setHoraAcordar(v) {
    config = config.copyWith(horaAcordar: v);
  }

  @action setMinutoAcordar(v) {
    config = config.copyWith(minutoAcordar: v);
  }

  @action setHoraDormir(v) {
   config = config.copyWith(horaDormir: v);
  }

  @action setMinutoDormir(v) {
    config = config.copyWith(minutoDormir: v);
  }

}
