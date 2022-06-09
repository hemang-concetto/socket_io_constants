import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String yyyyMMDDHmsString() => DateFormat("yyyy-MM-dd HH:mm:ss").format(this);
}
