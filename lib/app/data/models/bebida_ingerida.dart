
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("BebidaIngerida")
class BebidaIngeridas extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  IntColumn get quantidadeIngerida => integer()();
  IntColumn get bebidaId => integer().named('bebida_id')();
  DateTimeColumn get dataIngestao => dateTime().named('data_ingestao')();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
}