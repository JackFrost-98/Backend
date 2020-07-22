import 'package:catcare_login/setting.dart';
import 'package:flutter/material.dart';
import 'package:catcare_login/Animation/FadeAnimation.dart';
import 'models/profile_data.dart';

class PlaceholderWidgetFund extends StatelessWidget {
  PlaceholderWidgetFund();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Column(
                children: <Widget>[
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
                        FadeAnimation(
                          1,
                          Container(
                              child: ListTile(
                            leading: FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: null,
                              child: Icon(Icons.person),
                              backgroundColor: Colors.cyan[100],
                            ),
                            title: Text('Apip'),
                            subtitle: Text('Selangor, Malaysia'),
                            trailing: Container(
                              height: 40.0,
                              child: FloatingActionButton(
                                heroTag: "btn2",
                                onPressed: null,
                                child: Icon(Icons.add),
                                backgroundColor: Colors.cyan[100],
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.3,
                    Container(
                      height: 165.0,
                      width: 300.0,
                      child: Center(
                          child: Text(
                              'Hi Apip, We are really grateful that you are willng to make some funding yo these cats. Your fund will help a lot of stray cats feel more safe. Choose from these 3 at the bottom which you are willing to fund :',
                              style: TextStyle(
                                fontSize: 17.0,
                                height: 1.5,
                              ))),
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    Container(
                      height: 120.0,
                      child: Center(
                        child: Row(children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                            child: FlatButton(
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      'Please update you phone number to proceed.'),
                                  action: SnackBarAction(
                                      label: 'Go',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/setting');
                                      }),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                              child: Container(
                                height: 77.0,
                                width: 77.0,
                                child: Center(
                                    child: Text('Cat Food Fund',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          height: 1.5,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.cyan[100],
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                            child: FlatButton(
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      'Please update you phone number to proceed.'),
                                  action: SnackBarAction(
                                    label: 'Go',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingPage()),
                                      );
                                    },
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                              child: Container(
                                height: 77.0,
                                width: 77.0,
                                child: Center(
                                    child: Text('Cat Shelter Fund',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          height: 1.5,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.cyan[100],
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              final snackBar = SnackBar(
                                content: Text(
                                    'Please update you phone number to proceed.'),
                                action: SnackBarAction(
                                  label: 'Go',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingPage()),
                                    );
                                  },
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            child: Container(
                              height: 77.0,
                              width: 77.0,
                              child: Center(
                                  child: Text('Cat Neuter Fund',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1.5,
                                      ))),
                              decoration: BoxDecoration(
                                  color: Colors.cyan[100],
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    )
                                  ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.7,
                    Container(
                      height: 140.0,
                      child: Center(
                          child: Text('Currently Total Funding: \nRM200',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                height: 1.5,
                              ))),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 3.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.9,
                    Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 3.0,
                          )
                        ],
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  60.0, 20.0, 10.0, 0.0),
                              child: Icon(
                                Icons.favorite,
                                size: 35.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 26.0, 80.0, 0.0),
                              child: Text('209'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 20.0, 10.0, 0.0),
                              child: Icon(
                                Icons.share,
                                size: 35.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 26.0, 0.0, 0.0),
                              child: Text('100'),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
