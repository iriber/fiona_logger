import 'package:fiona_logger/src/domain/log_data.dart';
import 'package:fiona_logger/src/domain/log_data_repository.dart';
import 'package:get_it/get_it.dart';

enum Level { verbose, debug, info, warning, error }

class FionaLogger {
  Level level;
  late LogDataRepository logDataRepository;

  FionaLogger({this.level = Level.verbose}) {
    logDataRepository = GetIt.instance<LogDataRepository>();
  }

  Future<List<LogData>> getAll() async {
    return logDataRepository.getAll();
  }

  Future<void> clear() async {
    logDataRepository.clear();
  }

  void log(LogData log, Level level) {
    int levelIndex = Level.values.indexOf(level);
    int logLevelIndex = Level.values.indexOf(this.level);

    if (logLevelIndex <= levelIndex) {
      _writeLog(log);
    }
  }

  void _writeLog(LogData log) {
    logDataRepository.add(log);
  }

  void v(String message) {
    LogData data = LogData(message, level: Level.verbose);
    data.datetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    log(data, Level.verbose);
  }

  void w(String message) {
    LogData data = LogData(message, level: Level.warning);
    data.datetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    log(data, Level.warning);
  }

  void i(String message) {
    LogData data = LogData(message, level: Level.info);
    data.datetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    log(data, Level.info);
  }

  void d(String message) {
    LogData data = LogData(message, level: Level.debug);
    data.datetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    log(data, Level.debug);
  }

  void e(String message) {
    LogData data = LogData(message, level: Level.error);
    data.datetime = DateTime.now().toUtc().millisecondsSinceEpoch;
    log(data, Level.error);
  }
}
