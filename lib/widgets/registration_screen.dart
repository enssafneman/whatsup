import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp/uites/firebase_auth.dart';
import 'package:whatsapp/widgets/chat_details_screen.dart';
import 'package:whatsapp/widgets/main_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpass = TextEditingController();
  TextEditingController controllerconfrom = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Registor"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 160),
                  child: Center(
                    child: CircleAvatar(
                      radius: 65,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/logobatterfly.jpg",
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        prefix: Icon(Icons.email), hintText: "Email"),
                    controller: controlleremail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        prefix: Icon(Icons.password), hintText: "Password"),
                    controller: controllerpass,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        prefix: Icon(Icons.password),
                        hintText: " ConformPassword"),
                    controller: controllerpass,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    height: 50,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Login"))),
                TextButton(
                    onPressed: () async {
                      if (controlleremail.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("email is empty"),
                        ));
                      } else if (controllerpass.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("email is empty"),
                        ));
                      } else if (controllerpass.text !=
                          controllerconfrom.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("password not equal comform"),
                        ));
                      } else {
                        final x = await FirebaseAuthScreen()
                            .createAccount(
                                email: controlleremail.text.trim(),
                                pass: controllerpass.text.trim(),
                                context: context)
                            .whenComplete(() => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                  SnackBar(
                                    content: Text("Successfully sigin up"),
                                  ),
                                )
                                .closed);
                        if (x != null) {
                          Email = controlleremail.text.trim();

                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => const MianScreen(),
                              ),
                            );
                          });
                        }
                      }
                    },
                    child: Text("Registraion"))
              ],
            ),
          )),
    );
  }
}
