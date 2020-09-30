import 'package:login/features/presentation/scoped_models/base_model.dart';

class LoginSCModel extends BaseModel {
  String message;
  bool loginResult;
  Future<bool> login({String username, String password}) async {
    // Update state to loading so we can show indicator
    setState(ViewState.Busy);
    print("$username && $password");
    await Future.delayed(Duration(seconds: 1));

    // var loginResult = true; // Get real response here from service
    if (username == "test" && password == "test") {
      loginResult = true;
      message = "Thank you for $username your password is: $password";
      notifyListeners();
    } else {
      loginResult = false;
      message = "invalid Credentials";
    }
    // determine state of the view based on response.
    var loginStateBasedOnReponse =
        loginResult ? ViewState.Success : ViewState.Error;

    // Update the view state based on the response
    setState(loginStateBasedOnReponse);
    notifyListeners();
    return loginResult;
  }
}
