// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escolher_copo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EscolherCopoController on _EscolherCopoControllerBase, Store {
  final _$cupIdSelectedAtom =
      Atom(name: '_EscolherCopoControllerBase.cupIdSelected');

  @override
  int get cupIdSelected {
    _$cupIdSelectedAtom.context.enforceReadPolicy(_$cupIdSelectedAtom);
    _$cupIdSelectedAtom.reportObserved();
    return super.cupIdSelected;
  }

  @override
  set cupIdSelected(int value) {
    _$cupIdSelectedAtom.context.conditionallyRunInAction(() {
      super.cupIdSelected = value;
      _$cupIdSelectedAtom.reportChanged();
    }, _$cupIdSelectedAtom, name: '${_$cupIdSelectedAtom.name}_set');
  }

  final _$bebidasAtom = Atom(name: '_EscolherCopoControllerBase.bebidas');

  @override
  List<dynamic> get bebidas {
    _$bebidasAtom.context.enforceReadPolicy(_$bebidasAtom);
    _$bebidasAtom.reportObserved();
    return super.bebidas;
  }

  @override
  set bebidas(List<dynamic> value) {
    _$bebidasAtom.context.conditionallyRunInAction(() {
      super.bebidas = value;
      _$bebidasAtom.reportChanged();
    }, _$bebidasAtom, name: '${_$bebidasAtom.name}_set');
  }

  final _$_EscolherCopoControllerBaseActionController =
      ActionController(name: '_EscolherCopoControllerBase');

  @override
  dynamic selectCup(int id) {
    final _$actionInfo =
        _$_EscolherCopoControllerBaseActionController.startAction();
    try {
      return super.selectCup(id);
    } finally {
      _$_EscolherCopoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cupIdSelected: ${cupIdSelected.toString()},bebidas: ${bebidas.toString()}';
    return '{$string}';
  }
}
