import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String yyyyMMDDDHmsString() => DateFormat("yyyy-MM-dd HH:mm:ss").format(this);
}
