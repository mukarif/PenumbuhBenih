// import 'package:petani/model/DetailAnggota.dart';
import 'package:petani/util/api.dart';

abstract class GetDetailAnggotaContract {
  void onDetailAnggotaSuccess(dynamic user);
  void onDetailAnggotaError(String errorTxt);
}

class GetDetailAnggotaPresenter {
  final GetDetailAnggotaContract _view;
  RestDatasource api = RestDatasource();
  GetDetailAnggotaPresenter(this._view);

  doGetDetailAnggota(int id) {
    // ignore: avoid_print
    print("masuk Detail Anggota");
    api.getDetailAnggota(id).then((user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onDetailAnggotaSuccess(user);
    }).catchError((error) => _view.onDetailAnggotaError(error.toString()));
  }
}
