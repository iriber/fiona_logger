

import 'package:fiona_logger/src/log/fiona_logger.dart';
import 'package:intl/intl.dart';

class LogData{

  String message="";
  String level;
  int datetime=DateTime.now().toUtc().millisecondsSinceEpoch;
  int id=0;

  LogData(this.message, {this.id=0, required this.level});

  LogData.fromMap(Map<String, dynamic> item):level=Level.verbose.toString() {
    id=item["id"];
    message=item["message"];
    datetime=item["datetime"];
  }

  Map<String, Object> toMap(){
    return {'id': id, 'message': message, 'datetime': datetime};
  }

  String getFormattedDateTime(){
    var date = DateTime.fromMillisecondsSinceEpoch(datetime);
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }
}