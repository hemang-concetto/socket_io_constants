extension EnumgExt on Enum {
  // It converts to String from Enum object
  String enumValueToString() => toString().split('.').last;
}