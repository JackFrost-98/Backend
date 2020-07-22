import 'package:catcare_login/services/user_dataservice.dart';
import 'package:catcare_login/setting_edit.dart';
import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'menu.dart';

class SettingPage extends StatefulWidget {
  
  @override
  _SettingPageState createState() => new _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Profile user;
  final dataService = UserDataService();
  var userID = "KhpuUfQVcLIfKrG1PaJT";
  var namectrl = TextEditingController();
  var locationctrl = TextEditingController();
  var mailctrl = TextEditingController();
  var phonectrl = TextEditingController();
  var passwordctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile>(
      future: dataService.getUser(id: userID),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          user = snapshot.data;
          return _buildMainScreen();
        }
        return _buildFetchingDataScreen();
      });
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching user profile... Please wait'),
          ],
        ),
      ),
    );
  }

  Scaffold _buildMainScreen(){
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(70),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
          buildContainer(Icons.person, namectrl, user.name, false),
          buildContainer(
              Icons.location_on, locationctrl, user.location, false),
          buildContainer(Icons.mail, mailctrl, user.email, false),
          buildContainer(Icons.phone, phonectrl, user.phone, false),
          buildContainer(
              Icons.lock, passwordctrl, user.password, true),
        ],
      )),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(user)),
              );
            }),
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Colors.cyan[100],
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () => navigate()),
        ],
      ),
    );
  }

  navigate() async {
    final returnData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditSetting(
          Profile.copy(user),
          userID,
        ),
      ),
    );

    if (returnData != null) {
      setState(() => user = returnData);
    }
  }

  Container buildContainer(var icon, var ctrl, var data, var read) {
    ctrl.text = data;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Icon(
              icon,
              color: Colors.grey[500],
            ),
          ),
          Container(
            width: 280,
            child: TextField(
              controller: ctrl,
              readOnly: true,
              obscureText: read,
              decoration: new InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
