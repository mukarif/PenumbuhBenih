// import 'package:petani/model/alsintan.dart';
import 'package:petani/util/api.dart';

abstract class GetAlsintanContract {
  void onPostLoginSuccess(List user);
  void onPostLoginError(String errorTxt);
}

class GetAlsintanPresenter {
  final GetAlsintanContract _view;
  RestDatasource api = RestDatasource();
  GetAlsintanPresenter(this._view);

  doGetAlsintan() {
    // ignore: avoid_print
    print("masuk Alsintan");
    api.getAlsintan().then((List user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onPostLoginSuccess(user);
    }).catchError((error) => _view.onPostLoginError(error.toString()));
  }
}
