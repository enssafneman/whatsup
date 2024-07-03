import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendMassageViewe extends StatefulWidget {
  final Function(String) intputtex;

  const SendMassageViewe({
    super.key,
    required this.intputtex,
  });

  @override
  State<SendMassageViewe> createState() => _SendMassageVieweState();
}

class _SendMassageVieweState extends State<SendMassageViewe> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        color: Colors.white10,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: controller,
                  style: TextStyle(fontSize: 17),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.white10),
                      ),
                      suffixIcon: ElevatedButton(
                        onPressed: () {
                          widget.intputtex(controller.text);

                          print("rrrrr");
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                      ),
                      //fillColor: Colors.grey[300],
                      filled: true),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_outdoor_outlined,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
