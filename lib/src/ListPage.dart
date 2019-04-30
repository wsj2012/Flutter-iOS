// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';

class ListWidget extends StatefulWidget {
  
  final String _title;

  ListWidget(this._title);

  @override
  _ListWidgetState createState() => _ListWidgetState(_title);
}

class _ListWidgetState extends State<ListWidget>
    with AutomaticKeepAliveClientMixin {
  String _title;
  _ListWidgetState(this._title);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(_title),
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, i) {
            final color = (i % 2 == 0)
                ? CupertinoColors.activeOrange
                : CupertinoColors.activeBlue;
            return Container(
              color: color,
              height: 88,
              width: MediaQuery.of(context).size.width,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new CupertinoButton(
                    padding: EdgeInsets.only(left: 44,right: 44),
                    minSize: 44,
                    color: CupertinoColors.activeGreen,
                    child: Text(
                      '$i',
                      style: TextStyle(fontSize: 30, color: Color(0xffff0000)),
                    ),
                    // contentPadding: EdgeInsets.all(15),
                    onPressed: () {
                      print('$i');
                      if (i % 2 == 0) {
                        _laucherURL();
                      } else {
                        _getDeviceInfo();
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }

  void _laucherURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final andriodInfo = await deviceInfo.androidInfo;
      print(andriodInfo.model);
    }
    if (Platform.isIOS) {
      final iOSInfo = await deviceInfo.iosInfo;
      print(iOSInfo.model);
    }
  }
}
