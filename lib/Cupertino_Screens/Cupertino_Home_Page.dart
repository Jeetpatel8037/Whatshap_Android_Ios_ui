import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gloabal.dart';
import '../main.dart';
import 'Cupertino_Calls_Page.dart';
import 'Cupertino_Camera_Page.dart';
import 'Cupertino_Chats_Page.dart';
import 'Cupertino_Settings_Page.dart';
import 'Cupertino_Status_Page.dart';

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  List<Widget> tabs = const [
    CupertinoStatusPage(),
    CupertinoCallsPage(),
    CupertinoCameraPage(),
    CupertinoChatsPage(),
    CupertinoSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoSwitch(
            value: Global.isIOS,
            onChanged: (val) {
              setState(() {
                Global.isIOS = val;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              });
            }),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return tabs[index];
            },
          );
        },
      ),
    );
  }
}
