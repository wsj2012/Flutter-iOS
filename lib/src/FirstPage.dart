import 'package:flutter/cupertino.dart';

class FirstPage extends StatefulWidget {
  final String _title;
  FirstPage(this._title);
  @override
  FirstPageState createState() => new FirstPageState(_title);
}

class FirstPageState extends State<FirstPage> {

  String _title;
  FirstPageState(this._title);

  final rt = new CupertinoButton(
      child: new Image.asset("assets/images/nav_close.png"),
      onPressed: () {
        print("right clicked");
      },
    );
  
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_title),
        trailing: rt,
        border: Border.all(width: 0, color: CupertinoColors.darkBackgroundGray),
      ),
      child: new Container(
        child: new Center(
          child: new Text(
            "这是第一个界面",
            style: new TextStyle(
              color: CupertinoColors.darkBackgroundGray,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
    // return new CupertinoPageScaffold(
    //   navigationBar: CupertinoNavigationBar(
    //     middle: Text("First"),
    //     trailing: rt,
    //   ),
    //   child: new Container(
    //     child: new Center(
    //       child: new Text(
    //         "这是第一个界面",
    //         style: new TextStyle(
    //           color: CupertinoColors.activeBlue,
    //           fontSize: 18,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
