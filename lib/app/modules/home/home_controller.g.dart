// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  Computed<int> _$totalIngeridoHojeComputed;

  @override
  int get totalIngeridoHoje => (_$totalIngeridoHojeComputed ??=
          Computed<int>(() => super.totalIngeridoHoje))
      .value;

  final _$configAtom = Atom(name: '_HomeBase.config');

  @override
  Config get config {
    _$configAtom.context.enforceReadPolicy(_$configAtom);
    _$configAtom.reportObserved();
    return super.config;
  }

  @override
  set config(Config value) {
    _$configAtom.context.conditionallyRunInAction(() {
      super.config = value;
      _$configAtom.reportChanged();
    }, _$configAtom, name: '${_$configAtom.name}_set');
  }

  final _$bebidaAtom = Atom(name: '_HomeBase.bebida');

  @override
  dynamic get bebida {
    _$bebidaAtom.context.enforceReadPolicy(_$bebidaAtom);
    _$bebidaAtom.reportObserved();
    return super.bebida;
  }

  @override
  set bebida(dynamic value) {
    _$bebidaAtom.context.conditionallyRunInAction(() {
      super.bebida = value;
      _$bebidaAtom.reportChanged();
    }, _$bebidaAtom, name: '${_$bebidaAtom.name}_set');
  }

  final _$currentValueAtom = Atom(name: '_HomeBase.currentValue');

  @override
  int get currentValue {
    _$currentValueAtom.context.enforceReadPolicy(_$currentValueAtom);
    _$currentValueAtom.reportObserved();
    return super.currentValue;
  }

  @override
  set currentValue(int value) {
    _$currentValueAtom.context.conditionallyRunInAction(() {
      super.currentValue = value;
      _$currentValueAtom.reportChanged();
    }, _$currentValueAtom, name: '${_$currentValueAtom.name}_set');
  }

  final _$bebidasIngeridasHojeAtom =
      Atom(name: '_HomeBase.bebidasIngeridasHoje');

  @override
  List<dynamic> get bebidasIngeridasHoje {
    _$bebidasIngeridasHojeAtom.context
        .enforceReadPolicy(_$bebidasIngeridasHojeAtom);
    _$bebidasIngeridasHojeAtom.reportObserved();
    return super.bebidasIngeridasHoje;
  }

  @override
  set bebidasIngeridasHoje(List<dynamic> value) {
    _$bebidasIngeridasHojeAtom.context.conditionallyRunInAction(() {
      super.bebidasIngeridasHoje = value;
      _$bebidasIngeridasHojeAtom.reportChanged();
    }, _$bebidasIngeridasHojeAtom,
        name: '${_$bebidasIngeridasHojeAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void initConfig(dynamic config, dynamic bebida) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.initConfig(config, bebida);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBebidasIngeridasHoje(List<BebidaComBebidaIngerida> v) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setBebidasIngeridasHoje(v);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'config: ${config.toString()},bebida: ${bebida.toString()},currentValue: ${currentValue.toString()},bebidasIngeridasHoje: ${bebidasIngeridasHoje.toString()},totalIngeridoHoje: ${totalIngeridoHoje.toString()}';
    return '{$string}';
  }
}
