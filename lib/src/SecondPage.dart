import 'package:flutter/cupertino.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Second"),
        trailing: new CupertinoButton(
          child: new Image.asset("assets/images/nav_close.png"),
          onPressed: () {
            print("right clicked");
            Navigator.maybePop(context);
          },
        ),
        border: Border.all(width: 0, color: CupertinoColors.darkBackgroundGray),
      ),
      child: new Container(
        child: new Center(
          child: new Text(
            "这是第er个界面",
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
