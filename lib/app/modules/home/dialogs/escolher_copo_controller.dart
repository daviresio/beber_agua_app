import 'dart:convert';

import 'package:beber_agua/app/data/database.dart';
import 'package:beber_agua/app/data/models/config.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'escolher_copo_controller.g.dart';

class EscolherCopoController = _EscolherCopoControllerBase
    with _$EscolherCopoController;

abstract class _EscolherCopoControllerBase with Store {
  _EscolherCopoControllerBase() {
    listBebidas();
  }

  @observable
  int cupIdSelected;

  @action
  selectCup(int id) {
    cupIdSelected = id;
  }

  @observable
  List<dynamic> bebidas = [];

  listBebidas() {
    Database.instance.bebidaDao.list().listen((data) {
      bebidas = data;
    });
  }

  salvarNovaBebida() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var configString = prefs.getString(Config.preferenceKey);
    var configDecoded = json.decode(configString);
    Config config = Config.fromJson(configDecoded);

    var newConfig = config.copyWith(copoSelecionadoId: cupIdSelected);

    var _configJson = json.encode(newConfig.toJson());
    var _configString = _configJson.toString();
    await prefs.setString(
      Config.preferenceKey,
      _configString,
    );
  }
}
