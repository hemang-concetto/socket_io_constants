extension EnumgExt on Enum {
  String enumValueToString() => toString().split('.').last;
}

extension StringExt on String {
  T enumValueFromString<T>(Iterable<T> values) => values.firstWhere(
        (v) => v != null && this == (v as Enum).enumValueToString(),
        orElse: () => values.last,
      );
}
