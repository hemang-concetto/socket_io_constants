import 'package:intl/intl.dart';
import 'package:socket_io_constants/socket_io_constants.dart';

extension StringExt on String {
  // It converts to Enum object from String value
  T enumValueFromString<T>(Iterable<T> values) => values.firstWhere(
        (v) => v != null && this == (v as Enum).enumValueToString(),
        orElse: () => values.last,
      );

  DateTime yyyyMMDDDHmsDateTime() => DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
}
