// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialController on _InitialBase, Store {
  final _$configAtom = Atom(name: '_InitialBase.config');

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

  final _$_InitialBaseActionController = ActionController(name: '_InitialBase');

  @override
  dynamic setSexo(dynamic v) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.setSexo(v);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPeso(dynamic v) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.setPeso(v);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHoraAcordar(dynamic v) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.setHoraAcordar(v);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinutoAcordar(dynamic v) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.setMinutoAcordar(v);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHoraDormir(dynamic v) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.setHoraDormir(v);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinutoDormir(dynamic v) {
    final _$actionInfo = _$_InitialBaseActionController.startAction();
    try {
      return super.setMinutoDormir(v);
    } finally {
      _$_InitialBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'config: ${config.toString()}';
    return '{$string}';
  }
}
