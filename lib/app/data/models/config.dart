
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Config {
  final String sexo;
  final int peso;
  final int horaAcordar;
  final int minutoAcordar;
  final int horaDormir;
  final int minutoDormir;
  final int metaIngestao;
  final int metaIngestaoRecomendada;
  final int copoSelecionadoId;
  final List<Time> horariosLembretes;

  Config({this.sexo, this.peso, this.horaAcordar, this.minutoAcordar, this.horaDormir, this.minutoDormir, this.metaIngestao, this.metaIngestaoRecomendada, this.copoSelecionadoId, this.horariosLembretes});

  Config copyWith({
    int horaAcordar,
    int horaDormir,
    int metaIngestao,
    int metaIngestaoRecomendada,
    int minutoAcordar,
    int minutoDormir,
    int peso,
    String sexo,
    int copoSelecionadoId,
    List<Time> horariosLembretes,
  }) {
    return Config(
      horaAcordar: horaAcordar ?? this.horaAcordar,
      horaDormir: horaDormir ?? this.horaDormir,
      metaIngestao: metaIngestao ?? this.metaIngestao,
      metaIngestaoRecomendada:
      metaIngestaoRecomendada ?? this.metaIngestaoRecomendada,
      minutoAcordar: minutoAcordar ?? this.minutoAcordar,
      minutoDormir: minutoDormir ?? this.minutoDormir,
      peso: peso ?? this.peso,
      sexo: sexo ?? this.sexo,
      copoSelecionadoId: copoSelecionadoId ?? this.copoSelecionadoId,
      horariosLembretes: horariosLembretes ?? this.horariosLembretes,
    );
  }

  Map<String, dynamic> toJson() => {
    'sexo': sexo,
    'peso': peso,
    'horaAcordar': horaAcordar,
    'minutoAcordar': minutoAcordar,
    'horaDormir': horaDormir,
    'minutoDormir': minutoDormir,
    'metaIngestao': metaIngestao,
    'metaIngestaoRecomendada': metaIngestaoRecomendada,
    'copoSelecionadoId': copoSelecionadoId,
    'horariosLembretes': horariosLembretes,
  };

  Config.fromJson(Map<String, dynamic> json) :
        sexo = json['sexo'],
        peso = json['peso'],
        horaAcordar = json['horaAcordar'],
        minutoAcordar = json['minutoAcordar'],
        horaDormir = json['horaDormir'],
        minutoDormir = json['minutoDormir'],
        metaIngestao = json['metaIngestao'],
        metaIngestaoRecomendada = json['metaIngestaoRecomendada'],
        copoSelecionadoId = json['copoSelecionadoId'],
        horariosLembretes = json['horariosLembretes'];


  static const String preferenceKey = 'config_key';

  @override
  String toString() {
    return 'Config{sexo: $sexo, peso: $peso, horaAcordar: $horaAcordar, minutoAcordar: $minutoAcordar, horaDormir: $horaDormir, minutoDormir: $minutoDormir, metaIngestao: $metaIngestao, metaIngestaoRecomendada: $metaIngestaoRecomendada, copoSelecionadoId: $copoSelecionadoId, horariosLembretes: $horariosLembretes}';
  }


  static List<Time> calcIntervals(Config config) {
    List<Time> times = List();

    var intervalo = (config.horaDormir - config.horaAcordar) ~/ 4;

    times.add(Time(config.horaAcordar, config.minutoAcordar, 0));
    times.add(Time(config.horaAcordar + intervalo, 0, 0));
    times.add(Time(config.horaAcordar + (intervalo * 2), 0, 0));
    times.add(Time(config.horaAcordar + (intervalo * 3), 0, 0));
    times.add(Time(config.horaAcordar + (intervalo * 4), 0, 0));
    times.add(Time(config.horaDormir, config.minutoDormir, 0));

    return times;
  }


}