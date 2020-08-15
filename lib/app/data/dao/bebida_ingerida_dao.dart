import 'package:beber_agua/app/data/models/bebida.dart';
import 'package:beber_agua/app/data/models/bebida_ingerida.dart';
import 'package:beber_agua/app/data/models/bebidas_join.dart';
import 'package:beber_agua/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../database.dart';

part 'bebida_ingerida_dao.g.dart';

@UseDao(tables: [BebidaIngeridas, Bebidas])
class BebidaIngeridaDao extends DatabaseAccessor<Database>
    with _$BebidaIngeridaDaoMixin {
  final Database db;

  BebidaIngeridaDao(this.db) : super(db);

  Future<BebidaIngerida> find(int id) =>
      (select(bebidaIngeridas)..where((t) => t.id.equals(id))).getSingle();

  Stream<List<BebidaIngerida>> list() => select(bebidaIngeridas).watch();

  Future add(BebidaIngerida bebidaIngerida) =>
      into(bebidaIngeridas).insert(bebidaIngerida.copyWith(
          createdAt: DateTime.now(), updatedAt: DateTime.now()));

  Future edit(BebidaIngerida bebidaIngerida) => update(bebidaIngeridas)
      .replace(bebidaIngerida.copyWith(updatedAt: DateTime.now()));

  Future remove(id) =>
      (delete(bebidaIngeridas)..where((t) => t.id.equals(id))).go();

  dadosDoDia() {
    var hoje = DateTime.now();

    //FIXME por causa de um bug na comparacao do dia no filtro abaixo, eu preciso adicionar um dia para funcionar no dia certo
//    hoje = hoje.add(Duration(days: 1));

//    (select(bebidaIngeridas)).get().then((onValue) {
//      var a = onValue.map((f) => f.dataIngestao.day).toList();
//      print(a);
//    });

    return (select(bebidaIngeridas)
          ..where((t) {
            return t.dataIngestao.year.equals(hoje.year);
          }))
        .join([
          leftOuterJoin(bebidas, bebidaIngeridas.bebidaId.equalsExp(bebidas.id))
        ])
        .watch()
        .map((rows) => rows.map((row) {
              return BebidaComBebidaIngerida(
                  bebida: row.readTable(bebidas),
                  bebidaIngerida: row.readTable(bebidaIngeridas));
            }).toList());
  }
}
