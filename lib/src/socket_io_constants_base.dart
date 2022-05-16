// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Constants {
  Constants._privateConstructor();

  static final Constants _instance = Constants._privateConstructor();

  static Constants get instance => _instance;

  String addUser = "add_user";
  String userId = "user_id";
  String typing = "typing";
}
