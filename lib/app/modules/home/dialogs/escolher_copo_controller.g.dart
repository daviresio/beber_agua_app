// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escolher_copo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EscolherCopoController on _EscolherCopoControllerBase, Store {
  final _$cupIndexSelectedAtom =
      Atom(name: '_EscolherCopoControllerBase.cupIndexSelected');

  @override
  int get cupIndexSelected {
    _$cupIndexSelectedAtom.context.enforceReadPolicy(_$cupIndexSelectedAtom);
    _$cupIndexSelectedAtom.reportObserved();
    return super.cupIndexSelected;
  }

  @override
  set cupIndexSelected(int value) {
    _$cupIndexSelectedAtom.context.conditionallyRunInAction(() {
      super.cupIndexSelected = value;
      _$cupIndexSelectedAtom.reportChanged();
    }, _$cupIndexSelectedAtom, name: '${_$cupIndexSelectedAtom.name}_set');
  }

  final _$_EscolherCopoControllerBaseActionController =
      ActionController(name: '_EscolherCopoControllerBase');

  @override
  dynamic selectCup(int value) {
    final _$actionInfo =
        _$_EscolherCopoControllerBaseActionController.startAction();
    try {
      return super.selectCup(value);
    } finally {
      _$_EscolherCopoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'cupIndexSelected: ${cupIndexSelected.toString()}';
    return '{$string}';
  }
}
