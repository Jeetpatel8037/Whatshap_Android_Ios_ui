import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Android_Screens/Calls_page.dart';
import 'Android_Screens/Camera_page.dart';
import 'Android_Screens/Chat_page.dart';
import 'Android_Screens/Status_page.dart';
import 'Cupertino_Screens/Cupertino_Home_Page.dart';
import 'gloabal.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int initialStep = 0;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List tabs = const [
    ChatPage(),
    StatusPage(),
    CallsPage(),
    CameraPage(),
  ];
  int Currentindex = 3;

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xff075e54),
                secondary: const Color(0xff075e54),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(color: Colors.white60),
                ),
                bottom: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.white,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      child: Icon(Icons.camera_alt),
                    ),
                    Tab(
                      text: "CHATS",
                    ),
                    Tab(
                      text: "STATUS",
                    ),
                    Tab(
                      text: "CALLS",
                    ),
                  ],
                ),
                actions: [
                  Switch(
                      value: Global.isIOS,
                      onChanged: (val) {
                        setState(() {
                          Global.isIOS = val;
                        });
                      }),
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.search),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
              body: TabBarView(
                controller: tabController,
                children: const [
                  CameraPage(),
                  ChatPage(),
                  StatusPage(),
                  CallsPage(),
                ],
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(
              brightness: Brightness.light,
            ),
            routes: {
              '/': (context) => const CupertinoHomePage(),
            },
          );
  }
}
