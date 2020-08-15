import 'package:beber_agua/app/data/models/bebida.dart';
import 'package:beber_agua/app/data/models/bebida_ingerida.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'dao/bebida_dao.dart';
import 'dao/bebida_ingerida_dao.dart';

part 'database.g.dart';

@UseMoor(
    tables: [Bebidas, BebidaIngeridas], daos: [BebidaDao, BebidaIngeridaDao])
class Database extends _$Database {
  static Database instance = Database._internal();

  BebidaDao bebidaDao;
  BebidaIngeridaDao bebidaIngeridaDao;

  Database._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true)
          ..doWhenOpened((e) => e.runCustom('PRAGMA foreign_keys = ON'))) {
    bebidaDao = BebidaDao(this);
    bebidaIngeridaDao = BebidaIngeridaDao(this);
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onCreate: (Migrator m) async {
        m.createAllTables().then((onValue) async {
          await into(bebidas).insert(Bebida(
              ml: 100,
              imagemCopo: "cup-100.svg",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
          await into(bebidas).insert(Bebida(
              ml: 150,
              imagemCopo: "cup-150.svg",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
          await into(bebidas).insert(Bebida(
              ml: 200,
              imagemCopo: "cup-200.svg",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
          await into(bebidas).insert(Bebida(
              ml: 300,
              imagemCopo: "cup-300.svg",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
          await into(bebidas).insert(Bebida(
              ml: 400,
              imagemCopo: "cup-400.svg",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
        });
      });
}
