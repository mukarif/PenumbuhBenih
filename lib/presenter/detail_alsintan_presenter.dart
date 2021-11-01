// import 'package:petani/model/Detailalsintan.dart';
import 'package:petani/util/api.dart';

abstract class GetDetailAlsintanContract {
  void onPostLoginSuccess(dynamic user);
  void onPostLoginError(String errorTxt);
}

class GetDetailAlsintanPresenter {
  final GetDetailAlsintanContract _view;
  RestDatasource api = RestDatasource();
  GetDetailAlsintanPresenter(this._view);

  doGetDetailAlsintan(int id) {
    // ignore: avoid_print
    print("masuk Detail Alsintan");
    api.getDetailAlsintan(id).then((user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onPostLoginSuccess(user);
    }).catchError((error) => _view.onPostLoginError(error.toString()));
  }
}
