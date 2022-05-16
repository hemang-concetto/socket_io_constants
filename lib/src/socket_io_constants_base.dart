// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class SocketIoConstants {
  SocketIoConstants._privateConstructor();

  static final SocketIoConstants _instance = SocketIoConstants._privateConstructor();

  static SocketIoConstants get instance => _instance;

  String addUser = "add_user";
  String userId = "user_id";
  String typing = "typing";
  String userDisconnect = "onUserDisconnect";
}
