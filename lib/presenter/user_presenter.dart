import 'package:petani/util/api.dart';

abstract class GetUserContract {
  void onPostLoginSuccess(dynamic user);
  void onPostLoginError(String errorTxt);
}

class GetUserPresenter {
  final GetUserContract _view;
  RestDatasource api = RestDatasource();
  GetUserPresenter(this._view);

  doGetUser() {
    // ignore: avoid_print
    print("masuk");
    api.getUser().then((dynamic user) {
      // ignore: avoid_print
      print("ID User :: " + user['id'].toString());
      _view.onPostLoginSuccess(user);
    }).catchError((error) => _view.onPostLoginError(error.toString()));
  }
}
