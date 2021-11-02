// import 'package:petani/model/Perawatan.dart';
import 'package:petani/util/api.dart';

abstract class GetPerawatanContract {
  void onGetPerawatanSuccess(dynamic user);
  void onGetPerawatanError(String errorTxt);
}

class GetPerawatanPresenter {
  final GetPerawatanContract _view;
  RestDatasource api = RestDatasource();
  GetPerawatanPresenter(this._view);

  doGetPerawatan() {
    // ignore: avoid_print
    print("masuk Perawatan");
    api.getPerawatan().then((dynamic user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onGetPerawatanSuccess(user);
    }).catchError((error) => _view.onGetPerawatanError(error.toString()));
  }
}
