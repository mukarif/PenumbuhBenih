// import 'package:petani/model/DetailBudidaya.dart';
import 'package:petani/util/api.dart';

abstract class GetDetailBudidayaContract {
  void onDetailBudidayaSuccess(user);
  void onDetailBudidayaError(String errorTxt);
}

class GetDetailBudidayaPresenter {
  final GetDetailBudidayaContract _view;
  RestDatasource api = RestDatasource();
  GetDetailBudidayaPresenter(this._view);

  doGetDetailBudidaya(int id) {
    // ignore: avoid_print
    print("masuk Detail Budidaya");
    api.getDetailBudidaya(id).then((user) {
      // ignore: avoid_print
      print("ID User :: " + user['id'].toString());
      _view.onDetailBudidayaSuccess(user);
    }).catchError((error) => _view.onDetailBudidayaError(error.toString()));
  }
}
