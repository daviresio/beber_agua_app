import 'package:beber_agua/app/data/database.dart';

class BebidaComBebidaIngerida {
  final Bebida bebida;
  final BebidaIngerida bebidaIngerida;

  BebidaComBebidaIngerida({this.bebida, this.bebidaIngerida});

  @override
  String toString() =>
      'BebidaComBebidaIngerida(bebida: $bebida, bebidaIngerida: $bebidaIngerida)';
}
