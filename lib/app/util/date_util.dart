import 'package:flutter_local_notifications/flutter_local_notifications.dart';

String completeZeroDate(v) {
  if (v.toString().length == 1) return '0$v';
  return v.toString();
}

Time proximoHorario(List<Time> horarios) {
  var currentDate = DateTime.now();
  var now = Time(currentDate.hour, currentDate.minute, currentDate.second);
  List<Time> proximosHorarios = horarios.where((time) {
    if (time.hour > now.hour) {
      return true;
    } else if (time.hour == now.hour && time.minute > now.minute) {
      return true;
    }
    return false;
  }).toList();

  if (proximosHorarios.isEmpty) return horarios[0];

  proximosHorarios.sort((a, b) {
    var result = a.hour.compareTo(b.hour);
    if (result == 0) {
      result = a.minute.compareTo(b.minute);
    }
    return result;
  });

  return proximosHorarios[0];
}
