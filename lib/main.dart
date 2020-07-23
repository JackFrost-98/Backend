import 'package:catcare_login/Animation/FadeAnimation.dart';
import 'package:catcare_login/services/user_dataservice.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'models/profile.dart';
import 'homepage.dart';
import 'models/mock_posts.dart';

void main() => runApp(MaterialApp(
      //initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (context) => HomePage(),
      //   '/menu': (context) => MenuPage(),
      //   '/setting': (context) => SettingPage(prof),
      // },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<HomePage> {
  Profile user;
  final dataService = UserDataService();
  var userID = "KhpuUfQVcLIfKrG1PaJT";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile>(
      future: dataService.getUser(id: userID),
      builder: (context, snapshot) {
        user = snapshot.data;
        return _buildSplashScreen();
      });
  }
  SplashScreen _buildSplashScreen(){
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: MainScreen(user),
      image: new Image.asset('assets/images/catlogo.png'),
      loadingText: Text('We Care About Cats'),
      title: Text(
        "Cat Care",
        style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 20.0,
                color: Colors.black,
                offset: Offset(10.0, 10.0),
              ),
            ]),
      ),
      backgroundColor: Colors.cyan[100],
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      loaderColor: Colors.black,
    );
  }
}

class MainScreen extends StatefulWidget {
  final Profile user;
  MainScreen(this.user);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var emailctrl = TextEditingController();
  var passwordctrl = TextEditingController();
  final key = GlobalKey<FormState>();

  Container buildContainer(var label, var ctrl, var data, var read){
    ctrl.text = data;
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey[100]))),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
        ),
        onSaved: (text) => data = text,
        controller: ctrl,
        obscureText: read,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[100],
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        right: -200,
                        bottom: 5,
                        width: 800,
                        height: 250,
                        child: Center(
                          child: FadeAnimation(
                              1.5,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/catlogo.png'))),
                              )),
                        ),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 200),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.black,
                                          offset: Offset(10.0, 10.0),
                                        ),
                                      ]),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                buildContainer("Email", emailctrl, "", false),
                                buildContainer("Password", passwordctrl, "", true),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(10.0, 10.0,),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(101, 225, 210, 1),
                                  Color.fromRGBO(101, 225, 210, .6),
                                ])),
                            child: Center(
                              child: FlatButton(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  String email = emailctrl.text;
                                  String password = passwordctrl.text;
                                  if(widget.user.email == email && widget.user.password == password){
                                    Navigator.push(context, MaterialPageRoute(
                                      // builder: (context) => AuthenticatePage(email, password)),
                                      builder: (context) => MenuPage(widget.user.id)),
                                    );
                                  }
                                  else{
                                    showDialog(
                                      context: context, 
                                      barrierDismissible: false,
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('Authentication failed'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                    );
                                  }
                                  // Navigator.of(context).pushNamed('/menu');
                                }
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(
                                      10.0,
                                      10.0,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(78, 146, 236, 1),
                                  Color.fromRGBO(148, 188, 241, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "Login With Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                          1.5,
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
