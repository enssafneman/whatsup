import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/model/contact.dart';

class ContacteTite extends StatelessWidget {
  final Contact contact;
  const ContacteTite({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              Row(children: [
                CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: Image.network(
                        contact.Image,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //color: Colors.red,
                        // child:
                        Row(
                          children: [
                            Text(
                              contact.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Expanded(child: Container()),
                            // Text(
                            //   contact.date,
                            //   style: TextStyle(color: Colors.blue),
                            // )
                          ],
                        ),
                        //),
                        // Text(
                        //   contact.desc,
                        // ),
                      ],
                    ),
                  ),
                )
              ]),
              Divider(
                indent: 50,
              )
            ],
          ),
        ));
  }
}
