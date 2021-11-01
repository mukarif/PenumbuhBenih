import 'package:petani/util/api.dart';

abstract class GetAnggotaContract {
  void onPostLoginSuccess(List user);
  void onPostLoginError(String errorTxt);
}

class GetAnggotaPresenter {
  final GetAnggotaContract _view;
  RestDatasource api = RestDatasource();
  GetAnggotaPresenter(this._view);

  doGetAnggota() {
    // ignore: avoid_print
    print("masuk Anggota");
    api.getAnggota().then((List user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onPostLoginSuccess(user);
    }).catchError((error) => _view.onPostLoginError(error.toString()));
  }
}
