import 'package:petani/util/api.dart';

abstract class PostLoginContract {
  void onPostLoginSuccess(dynamic team);
  void onPostLoginError(String errorTxt);
}

class PostLoginPresenter {
  final PostLoginContract _view;
  RestDatasource api = RestDatasource();
  PostLoginPresenter(this._view);

  doPostLogin(String username, String password) {
    // ignore: avoid_print
    print("masuk");
    api.login(username, password).then((dynamic token) {
      // ignore: avoid_print
      print("data search :: " + token.toString());
      _view.onPostLoginSuccess(token);
    }).catchError((error) => _view.onPostLoginError(error.toString()));
  }
}
