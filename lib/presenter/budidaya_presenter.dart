// import 'package:petani/model/Perawatan.dart';
import 'package:petani/util/api.dart';

abstract class GetBudidayaContract {
  void onGetBudidayaSuccess(dynamic user);
  void onGetBudidayaError(String errorTxt);
}

class GetBudidayaPresenter {
  final GetBudidayaContract _view;
  RestDatasource api = RestDatasource();
  GetBudidayaPresenter(this._view);

  doGetBudidaya() {
    // ignore: avoid_print
    print("masuk Budidaya");
    api.getBudidaya().then((dynamic user) {
      // ignore: avoid_print
      print("ID User :: " + user[0].toString());
      _view.onGetBudidayaSuccess(user);
    }).catchError((error) => _view.onGetBudidayaError(error.toString()));
  }
}
