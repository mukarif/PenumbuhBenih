// import 'package:petani/model/Perawatan.dart';
import 'package:petani/util/api.dart';

abstract class GetPengurusContract {
  void onGetPengurusSuccess(dynamic user);
  void onGetPengurusError(String errorTxt);
}

class GetPengurusPresenter {
  final GetPengurusContract _view;
  RestDatasource api = RestDatasource();
  GetPengurusPresenter(this._view);

  doGetPengurus() {
    // ignore: avoid_print
    print("masuk Pengurus");
    // api.getPengurus().then((dynamic user) {
    //   // ignore: avoid_print
    //   print("ID User :: " + user[0].toString());
    //   _view.onGetPengurusSuccess(user);
    // }).catchError((error) => _view.onGetPengurusError(error.toString()));
  }
}
