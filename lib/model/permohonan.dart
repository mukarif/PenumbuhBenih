import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Permohonan extends Equatable {
  int id;
  String nama;
  String error;
  Permohonan(this.id, this.nama);
  Permohonan.withError(String errorMessage) {
    error = errorMessage;
  }
  Permohonan.map(dynamic obj) {
    id = obj["id"];
    nama = obj["nama"];
  }
  // ignore: recursive_getters
  int get ids => id;
  // ignore: recursive_getters
  String get namas => nama;
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["nama"] = nama;

    return map;
  }

  @override
  List<Object> get props => [id, nama];
}
