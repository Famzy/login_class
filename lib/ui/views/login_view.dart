import 'package:flutter/material.dart';
import 'package:login/helpers/ui_helpers.dart';
import 'package:login/scoped_models/login_view_model.dart';
import 'package:login/screen_card_vew.dart';
import 'package:login/ui/shared/font_styles.dart';
import 'package:login/ui/shared/ui_helpers.dart';
import 'package:login/ui/shared/ui_reducers.dart';
import 'package:login/ui/views/base_view.dart';
import 'package:login/ui/views/second_page_view.dart';
import 'package:login/ui/widgets/busy_overlay.dart';

class LoginViewView extends StatefulWidget {
  @override
  _LoginViewViewState createState() => _LoginViewViewState();
}

class _LoginViewViewState extends State<LoginViewView> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();
  String username;
  String passoword;
  String emailText;
  String passwordText;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailVal = "";
  String passwordVal = "";

  void showSnackbar(String msg, bool flag) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: (flag) ? Colors.green : Colors.red,
      action: SnackBarAction(
        label: "",
        textColor: Colors.white,
        onPressed: () {},
      ),
      duration: Duration(seconds: 10),
    ));
  }

  void validate(LoginViewViewModel model) async {
    if (_formKey.currentState.validate()) {
      bool result =
          await model.login(username: emailText, password: passwordText);

      await result
          ? showSnackbar(model.message, result)
          : showSnackbar(model.message, result);
      result
          ? Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 350),
                  pageBuilder: (context, _, __) => SecondPageView(
                        email: emailText,
                      )))
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewViewModel>(
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.Busy,
              child: Scaffold(
                  backgroundColor: Color.fromARGB(255, 26, 27, 30),
                  body: Scaffold(
                    key: _scaffoldKey,
//      appBar: AppBar(
//        title: Text("Login class"),
//      ),
                    body: Center(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/auth_background.png'),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Login Name!"),
                              InputHelpers.inputFormField(
                                  //controller: emailController,
                                  isPassword: false,
                                  placeholder: "Enter Email",
                                  keyboard: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Email cannot be empty";
                                    }
                                    setState(() {
                                      emailText = value.toString();
                                      print(emailText);
                                    });
                                  }),
                              SizedBox(
                                height: screenHeight(context) / 30,
                              ),
                              InputHelpers.inputFormField(
                                  // controller: passwordController,
                                  isPassword: true,
                                  placeholder: "Enter Password",
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Password Field cannot be empty";
                                    }
                                    setState(() {
                                      passwordText = value.toString();
                                      print(passwordText);
                                    });
                                  }),
                              SizedBox(height: screenHeight(context) / 25),
                              //SizedBox(height: 10,),
                              InputHelpers.fullScreenButton(
                                  title: "Login",
                                  onTap: () => validate(model),
                                  buttonColor: Colors.purple,
                                  buttunTextColor: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                    // This trailing comma makes auto-formatting nicer for build methods.
                  )),
            ));
  }

  Widget _getFeedbackUI(LoginViewViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor)),
        );
        break;
      case ViewState.Error:
        return Text('Could not log in at this moment');
      case ViewState.Success:
        return Center(child: Text('Login Success'));
      case ViewState.WaitingForInput:
      default:
        return Container();
    }
  }

  Widget _getLoginButton(LoginViewViewModel model) {
    return GestureDetector(
      onTap: () async {
        var viewState = model.login(username: 'Test', password: 'password');
        if (viewState == ViewState.Success) {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 350),
                  pageBuilder: (context, _, __) => SecondScreen()));
        }
      },
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color.fromARGB(255, 9, 202, 172)),
        child: Center(
            child:
                Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w800))),
      ),
    );
  }
}
