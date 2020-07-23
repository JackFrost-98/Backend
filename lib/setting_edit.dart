import 'package:catcare_login/services/user_dataservice.dart';
import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'setting.dart';

class EditSetting extends StatefulWidget {
  final Profile profile;
  final userID;

  EditSetting(this.profile, this.userID);

  @override
  _SettingPageState createState() => new _SettingPageState();
}

class _SettingPageState extends State<EditSetting> { 
  final dataService = UserDataService();
  var namectrl = TextEditingController();
  var locationctrl = TextEditingController();
  var mailctrl = TextEditingController();
  var phonectrl = TextEditingController();
  var passwordctrl = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Profile prof = widget.profile;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: key,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(70),
                  margin: const EdgeInsets.all(20),
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                    ),
                  ),
                ),
                buildContainer(Icons.person,namectrl,prof.name,false),
                buildContainer(Icons.location_on,locationctrl,prof.location,false),
                buildContainer(Icons.mail,mailctrl,prof.email,false),
                buildContainer(Icons.phone,phonectrl,prof.phone,false),
                buildContainer(Icons.lock,passwordctrl,prof.password,true),
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          this.key.currentState.save();
          prof.name = namectrl.text;
          prof.location = locationctrl.text;
          prof.email = mailctrl.text;
          prof.phone = phonectrl.text;
          prof.password = passwordctrl.text;
          //List<Profile> profile = [prof];
          dataService.updateUser(id: widget.userID, user: prof);
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(userID: widget.userID,)),);
        },
        child: Container(
          color: Colors.cyan[100],
          height: 60.0,
          child: Center(
              child: Text('SAVE CHANGES', textAlign: TextAlign.center, style: TextStyle(
              color: Colors.black,
            ),),
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Colors.cyan[100],
      ),
    );
  }

  Container buildContainer(var icon, var ctrl, var data, var read) {
    ctrl.text = data;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Icon(icon,
              color: Colors.grey[500],),
          ),
          Container(
            width: 280,
            child: TextFormField(
              onSaved: (text) => data = text,
              controller: ctrl,
              obscureText: read,
            ),
          ),
        ],
      ),
    );
  }
}