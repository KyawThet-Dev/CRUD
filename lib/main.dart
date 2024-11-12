import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:crud/core/presentation/widgets/app_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionReference users = db.collection('Users');
  final DocumentSnapshot snapshot = await users.doc('runtime').get();
  final userFields = snapshot.data();
  runApp(ProviderScope(child: AppWidget()));
}
