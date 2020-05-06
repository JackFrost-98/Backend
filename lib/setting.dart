import 'package:catcare_login/setting_edit.dart';
import 'package:flutter/material.dart';
import 'data/profile.dart';
import 'homepage.dart';

class SettingPage extends StatefulWidget {
  SettingPage(this.prof);

  final List<Profile> prof;

  @override
  _SettingPageState createState() => new _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var namectrl = TextEditingController();
  var locationctrl = TextEditingController();
  var mailctrl = TextEditingController();
  var phonectrl = TextEditingController();
  var passwordctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          buildContainer(Icons.person, namectrl, widget.prof[0].name, false),
          buildContainer(
              Icons.location_on, locationctrl, widget.prof[0].location, false),
          buildContainer(Icons.mail, mailctrl, widget.prof[0].email, false),
          buildContainer(Icons.phone, phonectrl, widget.prof[0].phone, false),
          buildContainer(
              Icons.lock, passwordctrl, widget.prof[0].password, true),
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
                    builder: (context) => HomePage(widget.prof, null)),
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
          Profile.copy(widget.prof[0]),
        ),
      ),
    );

    if (returnData != null) {
      setState(() => widget.prof[0] = returnData);
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
