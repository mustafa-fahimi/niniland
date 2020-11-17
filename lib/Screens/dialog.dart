import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyHomePage()),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Center(child: InkWell(
      onTap: (){
        showDialog(context: context,
          builder: (context) {
          return MyCustomDialog();
        },);
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Text("Tap Me"),
      ),
    ),);
  }
}

class MyCustomDialog extends StatefulWidget {
  @override
  _MyCustomDialogState createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  String teddyAction = "idle";
  //hands_down
  //hands_up
  //test
  //idle
  //fail
  //success

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 100,
            child: FlareActor("assets/images/Teddy.flr", alignment:Alignment.center, fit:BoxFit.fitHeight, animation:teddyAction)),
        Container(
          width: 300,
          height: 500,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              FlatButton(onPressed: (){
                setState(() {
                  teddyAction = "fail";
                });
              }, child: Text("fail")),
              FlatButton(onPressed: (){
                setState(() {
                  teddyAction = "success";
                });
              }, child: Text("success")),
            ],
          ),
        ),
      ],
    );
  }
}
