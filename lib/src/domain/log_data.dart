import 'package:fiona_logger/src/log/fiona_logger.dart';

class LogData {
  String message = "";
  Level level;
  int datetime = DateTime.now().toUtc().millisecondsSinceEpoch;
  int id = 0;

  LogData(this.message, {this.id = 0, required this.level});

  LogData.fromMap(Map<String, dynamic> item) : level = Level.verbose {
    id = item["id"];
    message = item["message"];
    datetime = item["datetime"];
  }

  Map<String, Object> toMap() {
    return {'id': id, 'message': message, 'datetime': datetime};
  }

  String getFormattedDateTime() {
    var date = DateTime.fromMillisecondsSinceEpoch(datetime);
    return formatDateTime(date, 'yyyy-MM-dd HH:mm:ss');
  }

  String getFormattedLevel() {
    String levelStr = level.toString();
    switch (level) {
      case Level.verbose:
        levelStr = "VERBOSE";
        break;
      case Level.warning:
        levelStr = "WARNING";
        break;
      case Level.debug:
        levelStr = "DEBUG";
        break;
      case Level.info:
        levelStr = "INFO";
        break;
      case Level.error:
        levelStr = "ERROR";
        break;
    }
    return levelStr;
  }

  String formatDateTime(DateTime dateTime, String format) {
    return format
        .replaceAll('yyyy', dateTime.year.toString())
        .replaceAll('MM', dateTime.month.toString().padLeft(2, '0'))
        .replaceAll('dd', dateTime.day.toString().padLeft(2, '0'))
        .replaceAll('HH', dateTime.hour.toString().padLeft(2, '0'))
        .replaceAll('mm', dateTime.minute.toString().padLeft(2, '0'))
        .replaceAll('ss', dateTime.second.toString().padLeft(2, '0'));
  }
}
