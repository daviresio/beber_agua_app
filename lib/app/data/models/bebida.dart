import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("Bebida")
class Bebidas extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  IntColumn get ml => integer()();
  TextColumn get imagemCopo => text().named('imagem_copo')();
  BoolColumn get isCustom =>
      boolean().nullable().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
}
