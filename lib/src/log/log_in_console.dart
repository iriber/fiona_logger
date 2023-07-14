import 'package:fiona_logger/src/domain/log_data.dart';
import 'package:fiona_logger/src/domain/log_data_repository.dart';
import 'package:flutter/foundation.dart';

class LogInConsole implements LogDataRepository {
  List<LogData> logs = List.empty(growable: true);

  @override
  Future<void> clear() async {
    logs = List.empty(growable: true);
  }

  @override
  Future<void> add(LogData logData) async {
    logs.add(logData);
    debugPrint(logData.message);
  }

  @override
  Future<List<LogData>> getAll() async {
    return logs;
  }
}
