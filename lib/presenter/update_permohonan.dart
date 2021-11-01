import 'package:petani/util/api.dart';

abstract class PutPermohonanContract {
  void onPutSuccess(user);
  void onPutError(String errorTxt);
}

class PutPermohonanPresenter {
  final PutPermohonanContract _view;
  RestDatasource api = RestDatasource();
  PutPermohonanPresenter(this._view);

  doPutPermohonan(int id) {
    // ignore: avoid_print
    print("masPutpermohonan");
    api.putPermohonanAnggota(id).then((user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onPutSuccess(user);
    }).catchError((error) => _view.onPutError(error.toString()));
  }
}
