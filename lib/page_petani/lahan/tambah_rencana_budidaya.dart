// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:location/location.dart';
import 'package:petani/page_petani/lahan/lahan.dart';
import 'package:petani/page_petani/perencanaan/rencana_budidaya.dart';
import 'package:image_picker/image_picker.dart';

class TambahRencanaBudidaya extends StatefulWidget {
  const TambahRencanaBudidaya({Key key}) : super(key: key);

  @override
  _TambahRencanaBudidayaState createState() => _TambahRencanaBudidayaState();
}

class _TambahRencanaBudidayaState extends State<TambahRencanaBudidaya> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();

  TextEditingController luasLahan = TextEditingController();
  TextEditingController jmlhBenih = TextEditingController();
  TextEditingController biayaBenih = TextEditingController();
  TextEditingController tngaKerja = TextEditingController();
  TextEditingController biayaTngaKrja = TextEditingController();
  TextEditingController hslPanen = TextEditingController();
  TextEditingController foto = TextEditingController();

  List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  String lahan;
  String kategoriKomoditas;
  String komoditas;
  String satuanBenih;
  String satuanJmlhTnga;
  String satuanPerkiraanPanen;
  String tglTanam;
  String tglPanen;
  String hasilPanen;

  List<Marker> myMarker = [];

  File _selectedImage;
  final picker = ImagePicker();

  // Location location = Location();
  // bool _serviceEnabled;
  // PermissionStatus _permissionGranted;
  // LocationData _locationData;

  Position currentocation;
  double lat;
  double lng;
  String message = "Google Maps";

  _handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          draggable: true,
          onDragEnd: (dragPosition) {
            print(dragPosition);
          }));
    });
  }

  Future<Widget> _chekcLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position now = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    Position last = await Geolocator.getLastKnownPosition();
    print("Lokasi saat ini : $now");
    print("Lokasi terakhir : $last");

    lat = now.latitude;
    lng = now.longitude;
    message = "$lat, $lng";
    print("$lat,$lng");
  }

  // _getLocation() async {
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (_serviceEnabled) return;
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) return;
  //   }
  //   _locationData = await location.getLocation();
  //   setState(() {
  //     lat = _locationData.latitude;
  //     lng = _locationData.longitude;
  //   });
  // }

  Future<Widget> reloadCurrentLocation;

  @override
  void initState() {
    super.initState();
    reloadCurrentLocation = _chekcLocation();
  }

  Widget getImageWidget() {
    if (_selectedImage != null) {
      return Image.file(
        _selectedImage,
        width: 400,
        height: 300,
        fit: BoxFit.cover,
      );
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  getImage(ImageSource source) async {
    final image = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: 1920,
      maxWidth: 1080,
      imageQuality: 96,
    );
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {
      print("Foto Kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const RencanaBudidaya());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: Get.height * 0.9,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Tambah Rencana Budidaya",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formLahan,
                  child: Column(
                    children: [
                      _formField("Pilih Lahan", lahan, _dropdownValues),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: GestureDetector(
                          onTap: () {
                            // _getLocation();
                            setState(() {
                              _chekcLocation();
                            });
                          },
                          child: Container(
                            child: lat == null || lng == null
                                ? Center(
                                    child: Text(message),
                                  )
                                : GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(lat, lng), zoom: 14),
                                    markers: Set.from(myMarker),
                                    mapType: MapType.hybrid,
                                    onTap: _handleTap,
                                  ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[200], spreadRadius: 3),
                              ],
                            ),
                            width: Get.width,
                            height: 200,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _tff("Luas Lahan", "Luas Lahan", luasLahan),
                      const SizedBox(
                        height: 10,
                      ),
                      _formField("Kategori Komoditas", kategoriKomoditas,
                          _dropdownValues),
                      const SizedBox(
                        height: 10,
                      ),
                      _formField("Komoditas", komoditas, _dropdownValues),
                      const SizedBox(
                        height: 5,
                      ),
                      _divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 5,
                              child: _tff(
                                  "Jumlah benih", "Jumlah benih", jmlhBenih)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 5,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: DropdownButtonFormField(
                                  hint: const Text("Satuan"),
                                  dropdownColor: Colors.white,
                                  items: _dropdownValues
                                      .map((value) => DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      satuanBenih = value;
                                      print(satuanBenih);
                                    });
                                  },
                                  // isExpanded: false,
                                  value: satuanBenih,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _tff("Biaya benih per satuan", "Biaya benih per satuan",
                          biayaBenih),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 5,
                            child: _tff("Jumlah tenaga kerja",
                                "Jumlah tenaga kerja", tngaKerja),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 5,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: DropdownButtonFormField(
                                  hint: const Text("Satuan"),
                                  dropdownColor: Colors.white,
                                  items: _dropdownValues
                                      .map((value) => DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      satuanJmlhTnga = value;
                                      print(satuanJmlhTnga);
                                    });
                                  },
                                  // isExpanded: false,
                                  value: satuanJmlhTnga,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _tff("Biaya tenaga kerja satuan",
                          "Biaya tenaga kerja satuan", biayaTngaKrja),
                      const SizedBox(
                        height: 5,
                      ),
                      _divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      _formField("Tanggal tanam", tglTanam, _dropdownValues),
                      const SizedBox(
                        height: 10,
                      ),
                      _formField(
                          "Perkiraan tanggal panen", tglPanen, _dropdownValues),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 5,
                            child: _tff("Perkiraan hasil panen",
                                "Perkiraan hasil panen", hslPanen),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 5,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: DropdownButtonFormField(
                                  hint: const Text("Satuan"),
                                  dropdownColor: Colors.white,
                                  items: _dropdownValues
                                      .map((value) => DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      satuanPerkiraanPanen = value;
                                      print(satuanPerkiraanPanen);
                                    });
                                  },
                                  // isExpanded: false,
                                  value: satuanPerkiraanPanen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _selectedImage == null ? _box(0) : _box(5),
                      getImageWidget(),
                      _selectedImage == null ? _box(0) : _box(10),
                      _selectedImage == null
                          ? _box(0)
                          : TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: Text("Hapus Foto"),
                              onPressed: () {
                                setState(() {
                                  _selectedImage = null;
                                });
                              },
                            ),
                      _selectedImage == null ? _box(0) : _box(10),
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25))),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(19, 15, 10, 5),
                            child: Text(
                              "Foto",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Subtotal",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Alat",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "25.000",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Tenaga Kerja",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "75.000",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.black,
                              indent: 270,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Total Biaya Tanam",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "200.000",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ButtonSimpan(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tff(String hint, String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black87),
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onSaved: (value) {
        controller.text = value;
      },
    );
  }

  Widget _formField(String hint, String onChange, List<String> list) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButtonFormField(
          hint: Text(hint),
          dropdownColor: Colors.white,
          items: list
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (String value) {
            setState(() {
              onChange = value;
              print(onChange);
            });
          },
          // isExpanded: false,
          value: onChange,
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      color: Colors.grey,
      indent: 10,
      endIndent: 10,
      thickness: 1,
    );
  }

  Widget _box(double h) {
    return SizedBox(
      height: h,
    );
  }
}

class ButtonSimpan extends StatelessWidget {
  const ButtonSimpan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: SizedBox(
        width: 200,
        child: TextButton(
          child: const Text(
            "Simpan",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ),
          onPressed: () {
            Get.to(() => const DaftarLahan());
          },
        ),
      ),
    );
  }
}
