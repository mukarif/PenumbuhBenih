// import 'package:petani/model/Perawatan.dart';
import 'package:petani/util/api.dart';

abstract class GetLahanContract {
  void onGetLahanSuccess(dynamic user);
  void onGetLahanError(String errorTxt);
}

class GetLahanPresenter {
  final GetLahanContract _view;
  RestDatasource api = RestDatasource();
  GetLahanPresenter(this._view);

  doGetLahan() {
    // ignore: avoid_print
    print("masuk Lahan");
    api.getLahan().then((dynamic user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onGetLahanSuccess(user);
    }).catchError((error) => _view.onGetLahanError(error.toString()));
  }
}
