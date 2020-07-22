import 'package:flutter/material.dart';
import 'Animation/FadeAnimation.dart';
import 'funding.dart';
import 'models/profile.dart';
import 'models/mock_posts.dart';
import 'models/posts.dart';


class HomePage extends StatefulWidget {
  final List<Profile> prof;
  final List<Post> _posts;
  HomePage(this.prof, this._posts);
  @override
  _HomePageState createState() => new _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List post = List();
  String input;


  initState(){
    super.initState();
    
    

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                title: Text("Post Story"),
                content: TextField(
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState((){
                        post.add(input);
                      });
                      Navigator.of(context).pop();
                    }, 
                    child: Text("Add")
                  ),
                ],
              );
          });
        },
        child: Icon(
          Icons.comment,
          color: Colors.white,
          // backgroundColor: Colors.cyan[100],
        ),
      ),
      body: Container(
        // new Text(),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: FadeAnimation(
            1.3,
            Center(
              child: ListView.builder(
                itemCount: post.length,
                itemBuilder: (BuildContext context, int index){
                  return Dismissible(key: Key(post[index]), 
                  child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/images/cat-1.jpg')),
                          ListTile(
                            title: Text(post[index]),
                            trailing: IconButton(
                              icon: Icon(
                              Icons.delete, 
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                post.removeAt(index);
                              });
                            },
                            ),
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      00.0, 20.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.access_time,
                                    size: 25.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 26.0, 30.0, 0.0),
                                  child: Text('1h ago'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      00.0, 20.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 25.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 26.0, 30.0, 0.0),
                                  child: Text('209'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 20.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.share,
                                    size: 25.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 26.0, 0.0, 0.0),
                                  child: Text('100'),
                                ),
                              ])
                        ],
                    ),
                    )
                  )
                  );
                }
              )
            ),
          ),
        ),
      ),
      // body: Container(
      //   padding: const EdgeInsets.all(5.0),
      //   child: FadeAnimation(
      //     1.3,
      //     Center(
      //       child: ListView.separated(
      //         itemCount: widget._posts.length,
      //         separatorBuilder: (context, index) => Divider(
      //           color: Colors.blueGrey,
      //         ),
      //         itemBuilder: (context, index) => Card(
      //           child: Container(
      //             padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      //             child: Column(
      //               children: <Widget>[
      //                 Image(image: AssetImage('assets/images/cat-1.jpg')),
      //                 Container(
      //                   child: Text(
      //                     widget._posts[index].title,
      //                     style: TextStyle(
      //                       fontSize: 24.0,
      //                       height: 1.5,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //                 Text(
      //                   widget._posts[index].description,
      //                   style: TextStyle(
      //                     fontSize: 16.0,
      //                     height: 1.5,
      //                   ),
      //                 ),
      //                 Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(
      //                             00.0, 20.0, 5.0, 0.0),
      //                         child: Icon(
      //                           Icons.access_time,
      //                           size: 25.0,
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(
      //                             0.0, 26.0, 30.0, 0.0),
      //                         child: Text('1h ago'),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(
      //                             00.0, 20.0, 5.0, 0.0),
      //                         child: Icon(
      //                           Icons.favorite,
      //                           size: 25.0,
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(
      //                             0.0, 26.0, 30.0, 0.0),
      //                         child: Text('209'),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(
      //                             0.0, 20.0, 5.0, 0.0),
      //                         child: Icon(
      //                           Icons.share,
      //                           size: 25.0,
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(
      //                             0.0, 26.0, 0.0, 0.0),
      //                         child: Text('100'),
      //                       ),
      //                     ])
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}


