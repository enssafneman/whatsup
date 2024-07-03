import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class FirebaseStoreScreen {
  final CollectionReference groupcollection =
      FirebaseFirestore.instance.collection("groups");
  Future<void> createOrUpdate(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController imageController = TextEditingController();

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  // prevent the soft keyboard from covering text fields
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: imageController,
                      decoration: const InputDecoration(
                        labelText: ' Groups Image URl',
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(labelText: ' Groups Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        child: Text("Create"),
                        onPressed: () async {
                          try {
                            String name = nameController.text.trim();
                            String imageUrl = imageController.text.trim();
                            print("Name: $name");
                            print("Image URL: $imageUrl");
                            // Check if both fields are not empty
                            if (!name.isEmpty && !imageUrl.isEmpty) {
                              print(
                                  "Validation failed: Name or Image URL cannot be empty");
                              // Add data to Firestore
                              await groupcollection.add({
                                "image": imageUrl,
                                "name": name,
                                "chat": [
                                  {"name": "", "text": ""}
                                ]
                              }); // Clear text fields
                              imageController.clear();
                              nameController.clear();
                            } else {
                              // Handle case where either field is empty
                              print("Name or Image URL cannot be empty");
                            }
                          } catch (e) {
                            // Handle Firestore operation errors
                            print("Error adding group to Firestore: $e");
                            // Optionally show an error message to the user
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    "Failed to create group. Please try again later."),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          }

                          // Hide the bottom sheet
                          Navigator.of(context).pop();
                        })
                  ]));
        });
  }
}
