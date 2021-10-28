import 'dart:async';
import 'dart:convert';

// import 'package:my_project_name/model/AllLeague.dart';
// import 'package:my_project_name/model/Schedule.dart';
import 'package:petani/helper/constant.dart';
import 'package:petani/util/network_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestDatasource {
  final JsonDecoder decoder = const JsonDecoder();
  final NetworkUtil _netUtil = NetworkUtil();

  Future<dynamic> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String patientPhone = /*added */ prefs.getString('access_token');
    // ignore: avoid_print
    print('tester token ::' + patientPhone);

    return patientPhone;
  }

  Future<dynamic> login(String useranme, String password) {
    return _netUtil
        .post(Uri.parse(LOGIN_URL),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
                <String, String>{"username": useranme, "password": password}))
        .then((dynamic res) {
      // ignore: avoid_print
      print("Message List : " + res.toString());
      return res;
    });
  }

  Future<dynamic> getUser() async {
    String token = await getToken();
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
      print("User List : " + res.toString());
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
