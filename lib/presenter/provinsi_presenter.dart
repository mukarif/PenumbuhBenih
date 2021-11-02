// import 'package:petani/model/Provinsi.dart';
import 'package:petani/util/api.dart';

abstract class GetProvinsiContract {
  void onGetProvinceSuccess(dynamic user);
  void onGetProvinceError(String errorTxt);
}

class GetProvinsiPresenter {
  final GetProvinsiContract _view;
  RestDatasource api = RestDatasource();
  GetProvinsiPresenter(this._view);

  doGetProvinsi() {
    // ignore: avoid_print
    print("masuk Provinsi");
    api.getProvinsi().then((dynamic user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onGetProvinceSuccess(user);
    }).catchError((error) => _view.onGetProvinceError(error.toString()));
  }
}
