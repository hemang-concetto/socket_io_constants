///
/// Class defines all constants which are used for SocketIO connection in server and client side both
///
class SocketIoConstants {
  SocketIoConstants._privateConstructor();

  static final SocketIoConstants _instance = SocketIoConstants._privateConstructor();

  static SocketIoConstants get instance => _instance;

  String addUser = "add_user";
  String userId = "user_id";
  String typing = "typing";
  String userDisconnect = "onUserDisconnect";
  String newUserAdded = "newUserAdded";
}
