import 'package:petani/model/permohonan.dart';
import 'package:petani/util/api.dart';

abstract class GetPermohonanContract {
  void onPostLoginSuccess(List user);
  void onPostLoginError(String errorTxt);
}

class GetPermohonanPresenter {
  final GetPermohonanContract _view;
  RestDatasource api = RestDatasource();
  GetPermohonanPresenter(this._view);

  doGetPermohonan() {
    // ignore: avoid_print
    print("masuk permohonan");
    api.getPermohonanAnggota().then((List user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onPostLoginSuccess(user);
    }).catchError((error) => _view.onPostLoginError(error.toString()));
  }
}
