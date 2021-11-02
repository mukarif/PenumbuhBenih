// import 'package:petani/model/Perawatan.dart';
import 'package:petani/util/api.dart';

abstract class GetCountAnggotaContract {
  void onGetCountAnggotaSuccess(int user);
  void onGetCountAnggotaError(String errorTxt);
}

class GetCountAnggotaPresenter {
  final GetCountAnggotaContract _view;
  RestDatasource api = RestDatasource();
  GetCountAnggotaPresenter(this._view);

  doGetCountAnggota() {
    // ignore: avoid_print
    print("masuk CountAnggota");
    api.getCountAnggota().then((int user) {
      // ignore: avoid_print
      print("ID User :: " + user.toString());
      _view.onGetCountAnggotaSuccess(user);
    }).catchError((error) => _view.onGetCountAnggotaError(error.toString()));
  }
}
