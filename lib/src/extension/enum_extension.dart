extension EnumgExt on Enum {
  // It converts to String from Enum object
  String enumValueToString() => toString().split('.').last;
}

extension StringExt on String {
  // It converts to Enum object from String value
  T enumValueFromString<T>(Iterable<T> values) => values.firstWhere(
        (v) => v != null && this == (v as Enum).enumValueToString(),
        orElse: () => values.last,
      );
}
