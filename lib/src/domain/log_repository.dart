
import 'package:fiona_logger/src/domain/log_data.dart';

abstract class LogDataRepository {

  Future<List<LogData>> getAll();

  Future<void> add(LogData logData);

  Future<void> clear();

}