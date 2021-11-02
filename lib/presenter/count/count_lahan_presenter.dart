// import 'package:petani/model/Perawatan.dart';
import 'package:petani/util/api.dart';

abstract class GetCountLahanContract {
  void onGetCountLahanSuccess(double count);
  void onGetCountLahanError(String errorTxt);
}

class GetCountLahanPresenter {
  final GetCountLahanContract _view;
  RestDatasource api = RestDatasource();
  GetCountLahanPresenter(this._view);

  doGetCountLahan() {
    // ignore: avoid_print
    print("masuk CountLahan");
    api.getCountLahan().then((double count) {
      // ignore: avoid_print
      print("ID count :: " + count.toString());
      _view.onGetCountLahanSuccess(count);
    }).catchError((error) => _view.onGetCountLahanError(error.toString()));
  }
}
