import 'package:flutter/material.dart';
import 'package:crud/contact/application/contact_notifier.dart';
import 'package:crud/contact/application/save_contact_notifier.dart';
import 'package:crud/core/shared/providers.dart';
import 'package:crud/contact/infrastructure/contact_remote_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/contact.dart';

final contactRemoteServiceProvider =
    Provider((ref) => ContactRemoteService(ref.watch(dioProvider)));

final contactNotifierProvider =
    StateNotifierProvider<ContactNotifier, ContactState>(
  (ref) => ContactNotifier(ref.watch(contactRemoteServiceProvider)),
);

final saveContactNotifierProvider =
    StateNotifierProvider<SaveContactNotifier, SaveContactState>(
  (ref) => SaveContactNotifier(ref.watch(contactRemoteServiceProvider)),
);

// Number_Change_Notifier
class ContactChangeNotifier extends ChangeNotifier {
  List<Contact> contacts = [];

  void add(Contact number) {
    contacts.add(number);
    notifyListeners();
  }

  void addAll(List<Contact> list) {
    contacts.clear();
    contacts.addAll(list);
    notifyListeners();
  }

  void clear() {
    contacts = [];
    notifyListeners();
  }

  void deleteByIndex(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }
}

// number_Change_Notifier_Provider
final contactListProvider =
    ChangeNotifierProvider<ContactChangeNotifier>((ref) {
  return ContactChangeNotifier();
});
