import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:whatsapp/uites/firebase_store.dart';
import 'package:whatsapp/widgets/send_massage_View.dart';

String Email = "";

class ChatDetailScreen extends StatefulWidget {
  final String Images;
  final String name;
  const ChatDetailScreen({super.key, required this.Images, required this.name});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

// List<String> chatLists = [
//   "Hi",
//   "Hello",
//   "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32."
// ];
// List<Chat> chatLists = [
//   Chat(
//     massage: "hi",
//     myMassage: false,
//   ),
//   Chat(
//     massage: "holle",
//     myMassage: true,
//   ),
//   Chat(
//     massage: "enssaf",
//     myMassage: false,
//   ),
//   Chat(
//     massage: "no ,sosan",
//     myMassage: true,
//   ),
//   Chat(
//     massage:
//         "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
//     myMassage: false,
//   ),
// ];--> تم تحويلها الى فيربيس

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  late String namenews;
  String documentId = " ";
  List<dynamic> chat = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                  radius: 15,
                  child: ClipOval(
                    child: Image.network(
                      widget.Images,
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  )),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "tap here for contact info",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(children: [
          Image.asset(
            "assets/background.jpg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: FirebaseStoreScreen().groupcollection.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      for (var item in streamSnapshot.data!.docs) {
                        if (item["name"] == widget.name) {
                          documentId = item.id;
                          chat = item["chat"];
                        }
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: chat.length,
                            itemBuilder: (ctx, index) {
                              final username = chat[index]["name"]
                                  .toString()
                                  .split("@")
                                  .first;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment: chatLists[index].myMassage
                                  //     ? MainAxisAlignment.start
                                  //     : MainAxisAlignment.end,
                                  mainAxisAlignment:
                                      chat[index]["name"].toString() == Email
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        // width:
                                        //     MediaQuery.of(context).size.width -
                                        //         16,
                                        decoration: BoxDecoration(
                                          // color: chatLists[index].myMassage
                                          //     ? Colors.white
                                          //     : Colors.grey,
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                username,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(chat[index]["text"]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ),
          // Column(
          //   children: [
          //     for(int i=0; i<=9; i++){
          //       return Container();
          //     }
          //   ],
          // )
        ]),
        bottomNavigationBar: SendMassageViewe(
          intputtex: (itemnew) {
            chat.add({"name": Email, "text": itemnew});
            FirebaseStoreScreen().groupcollection.doc(documentId).update(
                {"name": widget.name, "image": widget.Images, "chat": chat});
            // for (var i in chatLists) {
            //   if (i == i.myMassage) {
            // chatLists.add(Chat(massage: itemnew, myMassage: true));

            print("intp,,,,$itemnew");
            setState(() {});
            //   }
            // }
          },
        ));
  }
}
