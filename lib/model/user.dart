class User {
  int id;
  String username;
  String email;
  String detail;

  User(this.id, this.username, this.email, this.detail);
  User.map(dynamic obj) {
    id = obj["id"];
    username = obj["username"];
    email = obj["email"];
    detail = obj["detail"];
  }
  // ignore: recursive_getters
  int get ids => id;
  // ignore: recursive_getters
  String get usernames => username;
  // ignore: recursive_getters
  String get emails => email;
  // ignore: recursive_getters
  String get details => detail;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["username"] = username;
    map["email"] = email;
    map["detail"] = detail;

    return map;
  }
}
