class Token {
  String apiKey;
  String expiredDate;
  bool isActive;
  String profile;

  Token(this.apiKey, this.expiredDate, this.isActive, this.profile);
  Token.map(dynamic obj) {
    apiKey = obj["apiKey"];
    expiredDate = obj["expiredDate"];
    isActive = obj["isActive"];
    profile = obj["profile"];
  }
  // ignore: recursive_getters
  String get apiKeys => apiKey;
  // ignore: recursive_getters
  String get expiredDates => expiredDate;
  // ignore: recursive_getters
  bool get isActives => isActive;
  // ignore: recursive_getters
  String get profiles => profile;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["apiKey"] = apiKey;
    map["expiredDate"] = expiredDate;
    map["isActive"] = isActive;
    map["profile"] = profile;

    return map;
  }
}
