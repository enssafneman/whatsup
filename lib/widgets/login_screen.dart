import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/uites/firebase_auth.dart';
import 'package:whatsapp/widgets/chat_details_screen.dart';
import 'package:whatsapp/widgets/main_screen.dart';
import 'package:whatsapp/widgets/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
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
                SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          var x = await FirebaseAuthScreen().signin(
                              context: context,
                              email: controlleremail.text.trim(),
                              pass: controllerpass.text.trim());
                          if (x != null) {
                            Email = controlleremail.text.trim();
                            Future.delayed(const Duration(seconds: 3), () {
                              print('success');
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (_) => const MianScreen(),
                                ),
                              );
                            });
                          }
                        },
                        child: Text("Login"))),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return RegistrationScreen();
                      }));
                    },
                    child: Text("Registraion"))
              ],
            ),
          )),
    );
  }
}
