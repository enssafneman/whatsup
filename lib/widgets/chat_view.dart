import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/model/contact.dart';
import 'package:whatsapp/uites/firebase_store.dart';
import 'package:whatsapp/widgets/chat_details_screen.dart';
import 'package:whatsapp/widgets/contact_tite.dart';
import 'package:whatsapp/widgets/search_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ScrollController scrollController = ScrollController();
  // final CollectionReference contactscollection =
  //   FirebaseFirestore.instance.collection("contacts");
  // final CollectionReference groupcollection =
  //     FirebaseFirestore.instance.collection("groups");
  //--> تم عملية نقل

  double scrollPostion = 0;
  scorllListener() {
    setState(() {
      scrollPostion = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      scorllListener();
    });
  }

  List<Contact> contactList = [
    // Contact(
    //     Image:
    //         "https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-after.jpg?auto=avif,webp&format=jpg&width=944",
    //     date: "11:00",
    //     desc: "chat descriptions1",
    //     name: "enass Lazzeh"),
    // Contact(
    //     Image:
    //         "https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg",
    //     date: "1:00",
    //     desc: "chat descriptions2",
    //     name: "sawsan"),
    // Contact(
    //     Image:
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4DQ-tp12zlDGEUfulC2NNYwJ7vvskGXip6w&s",
    //     date: "10:00",
    //     desc: "chat descriptions3",
    //     name: "enssaf"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        scrollPostion == 0 ? Container() : SearchView(),
        Divider(),
        // Container(
        //   height: 1,
        //   color: Colors.grey,
        // ),

        Expanded(
          child: StreamBuilder(
              stream: FirebaseStoreScreen().groupcollection.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                // if (streamSnapshot.hasData) {

                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (streamSnapshot.hasError) {
                  print("999 ------------------->");
                  return Center(
                    child: Text('Error: ${streamSnapshot.error}'),
                  );
                } else if (!streamSnapshot.hasData ||
                    streamSnapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No groups available'),
                  );
                } else {
                  try {
                    return Expanded(
                      flex: 1,
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return InkWell(
                              // child: ContacteTite(
                              //   // contact:Contact(Image:  documentSnapshot['image'], date: documentSnapshot['date'], desc: documentSnapshot['desc'], name: documentSnapshot['name']),
                              // ),
                              child: ContacteTite(
                                contact: Contact(
                                    Image: documentSnapshot['image'],
                                    name: documentSnapshot['name']),
                              ),
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return ChatDetailScreen(
                                      // Images: contactList[index].Image,
                                      // name: contactList[index].name,
                                      Images: documentSnapshot['image'],
                                      name: documentSnapshot['name']);
                                }));
                              },
                            );
                          }),
                    );
                  } catch (e) {
                    print("$e ------------------->");
                    return Center(
                      child: Text('An error occurred: $e'),
                    );
                  }
                }
              }),
        )
      ],
    );
  }
}
