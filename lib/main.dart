import 'package:flutter/material.dart';
import 'helpers/ui_helpers.dart';
import 'helpers/screen_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void validate() {
    print("Details");
    username = emailText;
    passoword = passwordText;

    print("User Email: $username password: $passoword");
    if (_formKey.currentState.validate()) {
      showSnackbar(
          " Login details: email: $username password: $passoword", true);
    }
    //  if(username.isEmpty && passoword.isEmpty){
    //    setState(() {
    //      emailVal = "Email Cannot be empty";
    //      passwordVal = "Password Cannot be empty";
    //    });
    //   showSnackbar("Fileds cannot be empty", false);

    //  }
    // else{
    //    setState(() {
    //      emailVal = "";
    //      passwordVal = "";
    //    });
    //    showSnackbar(" Login details: email: $username password: $passoword", true);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login class"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
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
                    onTap: () => validate(),
                    buttonColor: Colors.blue,
                    buttunTextColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
