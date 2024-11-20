import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  Map<String, dynamic> users = {};
  var uuid = const Uuid();

  Future<void> _addData(String email) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    return users
        .add({'id': uuid.v4(), 'email': email, 'timestamp': DateTime.now()})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  _deleteData(String id) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Customer');
    return users
        .doc(id)
        .delete()
        .then((value) => print('User deleted'))
        .catchError((error) => print('Failed to delete user : $error'));
  }

  Future<void> updateData(String id, String email) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    return users
        .doc(id)
        .update({'name': email, 'timestamp': Timestamp.now()})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _userStream =
        FirebaseFirestore.instance.collection('Customer').snapshots();

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: _userStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              if (snapshot.data == null) {
                return Center(child: Text('${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot? document) {
                  if (document == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  Map<String, dynamic>? data =
                      document.data() as Map<String, dynamic>?;
                  users = data!;
                  String id = data['uid'] ?? '';
                  return InkWell(
                    onTap: () => _showDialog(context, data, id),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Card(
                        shadowColor: Colors.blue,
                        child: ListTile(
                            title: Text(data['name'] ?? ''),
                            trailing: IconButton(
                              onPressed: () => _deleteData(data['name']),
                              icon: const Icon(Icons.delete),
                            )),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showDialog(context, {}, '');
              emailController.clear();
            },
            child: const Icon(Icons.add)),
        // bottomNavigationBar: Container(
        //   height: 70,
        //   margin: const EdgeInsets.only(left: 30, right: 30),
        //   decoration: BoxDecoration(
        //       color: Colors.grey.withOpacity(0.2),
        //       borderRadius: BorderRadius.circular(25)),
        //   child: SalomonBottomBar(items: [
        //     SalomonBottomBarItem(
        //       icon: IconButton(
        //         onPressed: () {
        //           _showDialog(context, users);
        //         },
        //         icon: const Icon(Icons.add),
        //       ),
        //       title: const Text('Add'),
        //     ),
        //     SalomonBottomBarItem(
        //         icon: IconButton(
        //           onPressed: () {
        //             _showDialog(context, users);
        //           },
        //           icon: const Icon(Icons.delete),
        //         ),
        //         title: const Text('delete')),
        //     SalomonBottomBarItem(
        //         icon: IconButton(
        //             onPressed: () {
        //               _showDialog(context, users);
        //             },
        //             icon: const Icon(Icons.edit)),
        //         title: const Text('Edit'))
        //   ]),
        // ),
      ),
    );
  }

  _showDialog(ctx, Map<String, dynamic> data, String? docId) {
    if (data.isNotEmpty) {
      emailController.text = data['email'];
    } else {
      emailController.clear();
    }
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      const Center(child: Text('Are you sure to create?')),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Enter your email',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please type something';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (data.isEmpty) {
                          await _addData(emailController.text);
                          context.router.pop();
                        } else {
                          updateData(docId!, emailController.text);
                          context.router.pop();
                        }
                      }
                    },
                    child: const Text('Submit'))
              ],
            ));
  }
}
