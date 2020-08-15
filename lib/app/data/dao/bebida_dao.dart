import 'package:beber_agua/app/data/models/bebida.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../database.dart';

part 'bebida_dao.g.dart';

@UseDao(tables: [Bebidas])
class BebidaDao extends DatabaseAccessor<Database> with _$BebidaDaoMixin {
  final Database db;

  BebidaDao(this.db) : super(db);

  Future<Bebida> find(int id) =>
      (select(bebidas)..where((t) => t.id.equals(id))).getSingle();

  Stream<List<Bebida>> list() => select(bebidas).watch();

  Future add(Bebida bebida) => into(bebidas).insert(
      bebida.copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now()));

  Future edit(Bebida bebida) =>
      update(bebidas).replace(bebida.copyWith(updatedAt: DateTime.now()));

  Future remove(id) => (delete(bebidas)..where((t) => t.id.equals(id))).go();
}
