class ListAlsintan {
  int id;
  String nama;
  String merk;
  String keterangan;
  String foto;
  bool disewakan;
  String hargaSewa;
  String satuan;
  int poktan;
  int kategori;
  String created;
  String updated;
  ListAlsintan(
    this.id,
    this.nama,
    this.merk,
    this.keterangan,
    this.foto,
    this.disewakan,
    this.hargaSewa,
    this.satuan,
    this.poktan,
    this.kategori,
    this.created,
    this.updated,
  );
  ListAlsintan.map(dynamic obj) {
    id = obj["id"];
    nama = obj["nama"];
    merk = obj["merk"];
    keterangan = obj["keterangan"];
    foto = obj["foto"];
    disewakan = obj["disewakan"];
    hargaSewa = obj["hargaSewa"];
    satuan = obj["satuan"];
    poktan = obj["poktan"];
    kategori = obj["kategori"];
    created = obj["created"];
    updated = obj["updated"];
  }

  int get ids => id;
  String get namas => nama;
  String get merks => merk;
  String get keterangans => keterangan;
  String get fotos => foto;
  bool get disewakans => disewakan;
  String get hargaSewas => hargaSewa;
  String get satuans => satuan;
  int get poktans => poktan;
  int get kategoris => kategori;
  String get createds => created;
  String get updateds => updated;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["nama"] = nama;
    map["merk"] = merk;
    map["keterangan"] = keterangan;
    map["foto"] = foto;
    map["disewakan"] = disewakan;
    map["hargaSewa"] = hargaSewa;
    map["satuan"] = satuan;
    map["poktan"] = poktan;
    map["kategori"] = kategori;
    map["created"] = created;
    map["updated"] = updated;

    return map;
  }
}
