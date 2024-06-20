import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/model/contact.dart';
import 'package:whatsapp/widgets/chat_details_screen.dart';
import 'package:whatsapp/widgets/contact_tite.dart';
import 'package:whatsapp/widgets/search_view.dart';

class MianScreen extends StatefulWidget {
  const MianScreen({super.key});

  @override
  State<MianScreen> createState() => _MianScreenState();
}

class _MianScreenState extends State<MianScreen> {
  List<Contact> contactList = [
    Contact(
        Image:
            "https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-after.jpg?auto=avif,webp&format=jpg&width=944",
        date: "11:00",
        desc: "chat descriptions1",
        name: "enass Lazzeh"),
    Contact(
        Image:
            "https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
        date: "1:00",
        desc: "chat descriptions2",
        name: "sawsan"),
    Contact(
        Image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4DQ-tp12zlDGEUfulC2NNYwJ7vvskGXip6w&s",
        date: "10:00",
        desc: "chat descriptions3",
        name: "enssaf"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
      body: Column(
        children: [
          SearchView(),
          Divider(),
          // Container(
          //   height: 1,
          //   color: Colors.grey,
          // ),
          Expanded(
            child: ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ContacteTite(
                      contact: contactList[index],
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return ChatDetailScreen();
                      }));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
