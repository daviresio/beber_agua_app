// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Bebida extends DataClass implements Insertable<Bebida> {
  final int id;
  final int ml;
  final String imagemCopo;
  final DateTime createdAt;
  final DateTime updatedAt;
  Bebida(
      {this.id,
      @required this.ml,
      @required this.imagemCopo,
      @required this.createdAt,
      @required this.updatedAt});
  factory Bebida.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Bebida(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      ml: intType.mapFromDatabaseResponse(data['${effectivePrefix}ml']),
      imagemCopo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}imagem_copo']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  factory Bebida.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Bebida(
      id: serializer.fromJson<int>(json['id']),
      ml: serializer.fromJson<int>(json['ml']),
      imagemCopo: serializer.fromJson<String>(json['imagemCopo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ml': serializer.toJson<int>(ml),
      'imagemCopo': serializer.toJson<String>(imagemCopo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  @override
  BebidasCompanion createCompanion(bool nullToAbsent) {
    return BebidasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      ml: ml == null && nullToAbsent ? const Value.absent() : Value(ml),
      imagemCopo: imagemCopo == null && nullToAbsent
          ? const Value.absent()
          : Value(imagemCopo),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  Bebida copyWith(
          {int id,
          int ml,
          String imagemCopo,
          DateTime createdAt,
          DateTime updatedAt}) =>
      Bebida(
        id: id ?? this.id,
        ml: ml ?? this.ml,
        imagemCopo: imagemCopo ?? this.imagemCopo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Bebida(')
          ..write('id: $id, ')
          ..write('ml: $ml, ')
          ..write('imagemCopo: $imagemCopo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          ml.hashCode,
          $mrjc(imagemCopo.hashCode,
              $mrjc(createdAt.hashCode, updatedAt.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Bebida &&
          other.id == this.id &&
          other.ml == this.ml &&
          other.imagemCopo == this.imagemCopo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BebidasCompanion extends UpdateCompanion<Bebida> {
  final Value<int> id;
  final Value<int> ml;
  final Value<String> imagemCopo;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BebidasCompanion({
    this.id = const Value.absent(),
    this.ml = const Value.absent(),
    this.imagemCopo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BebidasCompanion.insert({
    this.id = const Value.absent(),
    @required int ml,
    @required String imagemCopo,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : ml = Value(ml),
        imagemCopo = Value(imagemCopo),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  BebidasCompanion copyWith(
      {Value<int> id,
      Value<int> ml,
      Value<String> imagemCopo,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return BebidasCompanion(
      id: id ?? this.id,
      ml: ml ?? this.ml,
      imagemCopo: imagemCopo ?? this.imagemCopo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class $BebidasTable extends Bebidas with TableInfo<$BebidasTable, Bebida> {
  final GeneratedDatabase _db;
  final String _alias;
  $BebidasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _mlMeta = const VerificationMeta('ml');
  GeneratedIntColumn _ml;
  @override
  GeneratedIntColumn get ml => _ml ??= _constructMl();
  GeneratedIntColumn _constructMl() {
    return GeneratedIntColumn(
      'ml',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imagemCopoMeta = const VerificationMeta('imagemCopo');
  GeneratedTextColumn _imagemCopo;
  @override
  GeneratedTextColumn get imagemCopo => _imagemCopo ??= _constructImagemCopo();
  GeneratedTextColumn _constructImagemCopo() {
    return GeneratedTextColumn(
      'imagem_copo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, ml, imagemCopo, createdAt, updatedAt];
  @override
  $BebidasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bebidas';
  @override
  final String actualTableName = 'bebidas';
  @override
  VerificationContext validateIntegrity(BebidasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.ml.present) {
      context.handle(_mlMeta, ml.isAcceptableValue(d.ml.value, _mlMeta));
    } else if (isInserting) {
      context.missing(_mlMeta);
    }
    if (d.imagemCopo.present) {
      context.handle(_imagemCopoMeta,
          imagemCopo.isAcceptableValue(d.imagemCopo.value, _imagemCopoMeta));
    } else if (isInserting) {
      context.missing(_imagemCopoMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bebida map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Bebida.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BebidasCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.ml.present) {
      map['ml'] = Variable<int, IntType>(d.ml.value);
    }
    if (d.imagemCopo.present) {
      map['imagem_copo'] = Variable<String, StringType>(d.imagemCopo.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<DateTime, DateTimeType>(d.updatedAt.value);
    }
    return map;
  }

  @override
  $BebidasTable createAlias(String alias) {
    return $BebidasTable(_db, alias);
  }
}

class BebidaIngerida extends DataClass implements Insertable<BebidaIngerida> {
  final int id;
  final int quantidadeIngerida;
  final int bebidaId;
  final DateTime dataIngestao;
  final DateTime createdAt;
  final DateTime updatedAt;
  BebidaIngerida(
      {this.id,
      @required this.quantidadeIngerida,
      @required this.bebidaId,
      @required this.dataIngestao,
      @required this.createdAt,
      @required this.updatedAt});
  factory BebidaIngerida.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BebidaIngerida(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      quantidadeIngerida: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}quantidade_ingerida']),
      bebidaId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}bebida_id']),
      dataIngestao: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}data_ingestao']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  factory BebidaIngerida.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BebidaIngerida(
      id: serializer.fromJson<int>(json['id']),
      quantidadeIngerida: serializer.fromJson<int>(json['quantidadeIngerida']),
      bebidaId: serializer.fromJson<int>(json['bebidaId']),
      dataIngestao: serializer.fromJson<DateTime>(json['dataIngestao']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantidadeIngerida': serializer.toJson<int>(quantidadeIngerida),
      'bebidaId': serializer.toJson<int>(bebidaId),
      'dataIngestao': serializer.toJson<DateTime>(dataIngestao),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  @override
  BebidaIngeridasCompanion createCompanion(bool nullToAbsent) {
    return BebidaIngeridasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      quantidadeIngerida: quantidadeIngerida == null && nullToAbsent
          ? const Value.absent()
          : Value(quantidadeIngerida),
      bebidaId: bebidaId == null && nullToAbsent
          ? const Value.absent()
          : Value(bebidaId),
      dataIngestao: dataIngestao == null && nullToAbsent
          ? const Value.absent()
          : Value(dataIngestao),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  BebidaIngerida copyWith(
          {int id,
          int quantidadeIngerida,
          int bebidaId,
          DateTime dataIngestao,
          DateTime createdAt,
          DateTime updatedAt}) =>
      BebidaIngerida(
        id: id ?? this.id,
        quantidadeIngerida: quantidadeIngerida ?? this.quantidadeIngerida,
        bebidaId: bebidaId ?? this.bebidaId,
        dataIngestao: dataIngestao ?? this.dataIngestao,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('BebidaIngerida(')
          ..write('id: $id, ')
          ..write('quantidadeIngerida: $quantidadeIngerida, ')
          ..write('bebidaId: $bebidaId, ')
          ..write('dataIngestao: $dataIngestao, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          quantidadeIngerida.hashCode,
          $mrjc(
              bebidaId.hashCode,
              $mrjc(dataIngestao.hashCode,
                  $mrjc(createdAt.hashCode, updatedAt.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BebidaIngerida &&
          other.id == this.id &&
          other.quantidadeIngerida == this.quantidadeIngerida &&
          other.bebidaId == this.bebidaId &&
          other.dataIngestao == this.dataIngestao &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BebidaIngeridasCompanion extends UpdateCompanion<BebidaIngerida> {
  final Value<int> id;
  final Value<int> quantidadeIngerida;
  final Value<int> bebidaId;
  final Value<DateTime> dataIngestao;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BebidaIngeridasCompanion({
    this.id = const Value.absent(),
    this.quantidadeIngerida = const Value.absent(),
    this.bebidaId = const Value.absent(),
    this.dataIngestao = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BebidaIngeridasCompanion.insert({
    this.id = const Value.absent(),
    @required int quantidadeIngerida,
    @required int bebidaId,
    @required DateTime dataIngestao,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : quantidadeIngerida = Value(quantidadeIngerida),
        bebidaId = Value(bebidaId),
        dataIngestao = Value(dataIngestao),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  BebidaIngeridasCompanion copyWith(
      {Value<int> id,
      Value<int> quantidadeIngerida,
      Value<int> bebidaId,
      Value<DateTime> dataIngestao,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return BebidaIngeridasCompanion(
      id: id ?? this.id,
      quantidadeIngerida: quantidadeIngerida ?? this.quantidadeIngerida,
      bebidaId: bebidaId ?? this.bebidaId,
      dataIngestao: dataIngestao ?? this.dataIngestao,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class $BebidaIngeridasTable extends BebidaIngeridas
    with TableInfo<$BebidaIngeridasTable, BebidaIngerida> {
  final GeneratedDatabase _db;
  final String _alias;
  $BebidaIngeridasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _quantidadeIngeridaMeta =
      const VerificationMeta('quantidadeIngerida');
  GeneratedIntColumn _quantidadeIngerida;
  @override
  GeneratedIntColumn get quantidadeIngerida =>
      _quantidadeIngerida ??= _constructQuantidadeIngerida();
  GeneratedIntColumn _constructQuantidadeIngerida() {
    return GeneratedIntColumn(
      'quantidade_ingerida',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bebidaIdMeta = const VerificationMeta('bebidaId');
  GeneratedIntColumn _bebidaId;
  @override
  GeneratedIntColumn get bebidaId => _bebidaId ??= _constructBebidaId();
  GeneratedIntColumn _constructBebidaId() {
    return GeneratedIntColumn(
      'bebida_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dataIngestaoMeta =
      const VerificationMeta('dataIngestao');
  GeneratedDateTimeColumn _dataIngestao;
  @override
  GeneratedDateTimeColumn get dataIngestao =>
      _dataIngestao ??= _constructDataIngestao();
  GeneratedDateTimeColumn _constructDataIngestao() {
    return GeneratedDateTimeColumn(
      'data_ingestao',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, quantidadeIngerida, bebidaId, dataIngestao, createdAt, updatedAt];
  @override
  $BebidaIngeridasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bebida_ingeridas';
  @override
  final String actualTableName = 'bebida_ingeridas';
  @override
  VerificationContext validateIntegrity(BebidaIngeridasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.quantidadeIngerida.present) {
      context.handle(
          _quantidadeIngeridaMeta,
          quantidadeIngerida.isAcceptableValue(
              d.quantidadeIngerida.value, _quantidadeIngeridaMeta));
    } else if (isInserting) {
      context.missing(_quantidadeIngeridaMeta);
    }
    if (d.bebidaId.present) {
      context.handle(_bebidaIdMeta,
          bebidaId.isAcceptableValue(d.bebidaId.value, _bebidaIdMeta));
    } else if (isInserting) {
      context.missing(_bebidaIdMeta);
    }
    if (d.dataIngestao.present) {
      context.handle(
          _dataIngestaoMeta,
          dataIngestao.isAcceptableValue(
              d.dataIngestao.value, _dataIngestaoMeta));
    } else if (isInserting) {
      context.missing(_dataIngestaoMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BebidaIngerida map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BebidaIngerida.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BebidaIngeridasCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.quantidadeIngerida.present) {
      map['quantidade_ingerida'] =
          Variable<int, IntType>(d.quantidadeIngerida.value);
    }
    if (d.bebidaId.present) {
      map['bebida_id'] = Variable<int, IntType>(d.bebidaId.value);
    }
    if (d.dataIngestao.present) {
      map['data_ingestao'] =
          Variable<DateTime, DateTimeType>(d.dataIngestao.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<DateTime, DateTimeType>(d.updatedAt.value);
    }
    return map;
  }

  @override
  $BebidaIngeridasTable createAlias(String alias) {
    return $BebidaIngeridasTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BebidasTable _bebidas;
  $BebidasTable get bebidas => _bebidas ??= $BebidasTable(this);
  $BebidaIngeridasTable _bebidaIngeridas;
  $BebidaIngeridasTable get bebidaIngeridas =>
      _bebidaIngeridas ??= $BebidaIngeridasTable(this);
  BebidaDao _bebidaDao;
  BebidaDao get bebidaDao => _bebidaDao ??= BebidaDao(this as Database);
  BebidaIngeridaDao _bebidaIngeridaDao;
  BebidaIngeridaDao get bebidaIngeridaDao =>
      _bebidaIngeridaDao ??= BebidaIngeridaDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [bebidas, bebidaIngeridas];
}
