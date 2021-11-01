import 'dart:async';
import 'dart:convert';

import 'package:petani/helper/constant.dart';
import 'package:petani/util/network_util.dart';
import 'package:petani/helper/local_storage.dart';

class RestDatasource {
  final JsonDecoder decoder = const JsonDecoder();
  final NetworkUtil _netUtil = NetworkUtil();
  final LocalStorage _token = LocalStorage();

  Future<void> login(String useranme, String password) async {
    try {
      return _netUtil
          .post(Uri.parse(LOGIN_URL),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Accept': 'application/json',
              },
              body: jsonEncode(
                  <String, String>{"username": useranme, "password": password}))
          .then((dynamic res) {
        _token.saveToken(res['api_key']);
        // ignore: avoid_print
        print("Token : " + res['api_key'].toString());
        getUser();
        return res;
      });
    } catch (e) {
      throw Exception("dladok $e");
    }
  }

  Future<dynamic> getUser() async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil.get(
      Uri.parse(GET_USER),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((dynamic res) {
      // ignore: avoid_print
      print("Ambil Data Lokal : " + res.toString());
      return res;
    });
  }

  Future<List> getPermohonanAnggota() async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil.get(
      Uri.parse(GET_PERMOHONAN),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((dynamic res) {
      // ignore: avoid_print
      print("User List : " + res.toString());
      return res;
    });
  }

  Future<List> getAnggota() async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil.get(
      Uri.parse(GET_ANGGOTA),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((dynamic res) {
      // ignore: avoid_print
      print("User List : " + res.toString());
      return res;
    });
  }

  Future<dynamic> getDetailAnggota(int id) async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil.get(
      Uri.parse(GET_ANGGOTA + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((dynamic res) {
      print("data res : " + res.toString());
      return res;
    });
  }

  Future<dynamic> putPermohonanAnggota(int id) async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil
        .put(Uri.parse(PUT_PERMOHONAN_ANGGOTA),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({"id": id}))
        .then((dynamic res) {
      print("data res : " + res.toString());
      return res;
    });
  }

  Future<List<dynamic>> getAlsintan() async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil.get(
      Uri.parse(GET_ALSINTAN),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((dynamic res) {
      print("data res : " + res["results"].toString());
      return res["results"];
    });
  }

  Future<dynamic> getDetailAlsintan(int id) async {
    String token = await _token.getAccessToken();
    // ignore: avoid_print
    print("token user :: " + token);
    return _netUtil.get(
      Uri.parse(GET_ALSINTAN + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((dynamic res) {
      print("data res : " + res.toString());
      return res;
    });
  }

  // Future<List<AllLeague>> allSport() async{
  //   return _netUtil.get(allSportUrl).then((dynamic res) {
  //     List<AllLeague> sportArr=[];
  //     for(int i=0;i<res["leagues"].length;i++){
  //       sportArr.add(AllLeague.map(res["leagues"][i]));
  //     }
  //     print("Message List : "+sportArr.length.toString());
  //     return sportArr;
  //   });
  // }

  // Future<List<ListTeam>> listTeam(String country) async{
  //   String url = getTeamUrl+country;
  //   print(url);
  //   return _netUtil.get(url).then((dynamic res) {
  //     List<ListTeam> teamArr=[];
  //     for(int i=0;i<res["teams"].length;i++){
  //       teamArr.add(ListTeam.map(res["teams"][i]));
  //     }
  //     print("Message List : "+teamArr.length.toString());
  //     return teamArr;
  //   });
  // }

  // Future<List<Schedule>> listSchedule(String id) async{
  //   String url = getScheduleUrl+id;
  //   print(url);
  //   return _netUtil.get(url).then((dynamic res) {
  //     List<Schedule> scheduleArr=[];
  //     for(int i=0;i<res["events"].length;i++){
  //       scheduleArr.add(Schedule.map(res["events"][i]));
  //     }
  //     print("Message List : "+scheduleArr.length.toString());
  //     return scheduleArr;
  //   });
  // }

  // Future<List<ListTeam>> searchTeam(String search) async{
  //   String url = searchTeamUrl+search;
  //   print(url);
  //   return _netUtil.get(url).then((dynamic res) {
  //     List<ListTeam> teamArr=[];
  //     for(int i=0;i<res["teams"].length;i++){
  //       teamArr.add(ListTeam.map(res["teams"][i]));
  //     }
  //     print("Message List : "+teamArr.length.toString());
  //     return teamArr;
  //   });
  // }
}
