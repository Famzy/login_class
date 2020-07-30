import 'package:flutter/material.dart';

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
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String username;
  String passoword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showSnackbar(String msg, bool flag){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: (flag) ? Colors.green : Colors.red,
        action: SnackBarAction(label: "", textColor: Colors.white, onPressed: (){},),
        duration: Duration(seconds: 10),
        )

    );
  }
  void validate(){
    print("Details");
     username = emailController.text;
     passoword = passwordController.text;
     if(username.isEmpty && passoword.isEmpty){
      showSnackbar("Fileds cannot be empty", false);

     }
    else{
       showSnackbar(" Login details: email: $username password: $passoword", true);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login class"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Login Name!"),
              TextField(
          
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,

              ),
              TextField(
                obscureText: true,
                controller: passwordController,
              ),
              FlatButton(onPressed:validate, child: Text("Login"),)
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
