import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/uites/firebase_store.dart';
import 'package:whatsapp/widgets/chat_view.dart';
import 'package:path/path.dart';

class MianScreen extends StatefulWidget {
  const MianScreen({super.key});

  @override
  State<MianScreen> createState() => _MianScreenState();
}

class _MianScreenState extends State<MianScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: TextButton(
            child: Text("Edite"),
            onPressed: () {},
          ),
          title: Text("chats"),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
            SizedBox(
              height: 60,
            ),
            IconButton(
              icon: Icon(Icons.add_home_sharp),
              onPressed: () {
                FirebaseStoreScreen().createOrUpdate(context);
              },
            ),
            SizedBox(
              height: 80,
            ),
          ],
          // bottom: TabBar(
          //   tabs: [
          //     Tab(text: "Chats", icon: Icon(Icons.chat)),
          //     Tab(text: "Updates", icon: Icon(Icons.update)),
          //     Tab(text: "Calls", icon: Icon(Icons.call)),
          //     Tab(text: "Communits", icon: Icon(Icons.commute)),
          //     Tab(text: "group", icon: Icon(Icons.group)),
          //   ],
          // ),
        ),
        body: // SafeArea(
            // child: Column(
            // children: [
            //   Expanded(
            //child:
            TabBarView(children: [
          ChatView(),
          Center(
              child: Text(
            "wecome to updates",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "wecome to Calls",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Center(
            child: Text(
              "wecome to comunite",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
              child: Text(
            "wecome to group ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ]),
        // ),

        // ],
        // ),
        // ),
        bottomNavigationBar: SafeArea(
          child: Container(
            color: Colors.red,
            child: TabBar(
              tabs: [
                Tab(text: "Chats", icon: Icon(Icons.chat)),
                Tab(text: "Updates", icon: Icon(Icons.update)),
                Tab(text: "Calls", icon: Icon(Icons.call)),
                Tab(text: "Communits", icon: Icon(Icons.commute)),
                Tab(text: "group", icon: Icon(Icons.group)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
