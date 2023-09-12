class LocalData {
  static final LocalData _instance = LocalData._internal();
  late String token;
  late String role;
  late List<String> beehiveSerialNumbers=[];
  factory LocalData() {
    return _instance;
  }

  LocalData._internal();
}

