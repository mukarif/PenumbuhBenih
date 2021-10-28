import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static final NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(Uri url, {Map<String, String> headers}) {
    return http.get(url, headers: headers).then((http.Response response) {
      // ignore: avoid_print
      print("status_code1:" + response.toString());
      final String res = response.body;
      final int statusCode = response.statusCode;
      final data = _decoder.convert(res);
      print("status_res:" + response.body.toString());
      print("statusCode:" + statusCode.toString());
      if (statusCode == 200) {
        return _decoder.convert(res);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(Uri url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      // ignore: avoid_print
      print("status_code2:" + response.statusCode.toString());
      final String res = response.body;
      final int statusCode = response.statusCode;

      // ignore: avoid_print

      /*if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }*/
      if (statusCode == 200) {
        return _decoder.convert(res);
      } else {
        if (statusCode == 404) {
          // ignore: avoid_print
          print("status_code2:" + res.toString());
          throw Exception("404"); // Code Salah
        }
        if (statusCode == 500) {
          // ignore: avoid_print
          print("status_code2:" + res.toString());
          throw Exception("500");
        }
        if (statusCode == 408) {
          // ignore: avoid_print
          print("status_code2:" + res.toString());
          throw Exception("408"); //expaied Code Verifikasi Resend
        }
        // ignore: avoid_print
        print("status_code2:" + res.toString());
        throw Exception("Error while fetching data");
      }
      //return _decoder.convert(res);
    });
  }

  Future<dynamic> put(Uri url, {Map headers, body, encoding}) {
    return http
        .put(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      print("status_code3:" + response.statusCode.toString());
      final String res = response.body;
      final int statusCode = response.statusCode;

      /*if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }*/
      if (statusCode == 200) {
        return _decoder.convert(res);
      } else {
        throw Exception("Error while fetching data");
      }
      //return _decoder.convert(res);
    });
  }
}
