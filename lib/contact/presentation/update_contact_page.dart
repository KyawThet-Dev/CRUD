import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_crud/contact/shared/contact_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/contact.dart';

@RoutePage()
class UpdateContactPage extends ConsumerStatefulWidget {
  final Contact contact;
  const UpdateContactPage(this.contact, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateContactPageState();
}

class _UpdateContactPageState extends ConsumerState<UpdateContactPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setData();
  }

  Future<void> setData() async {
    nameController.text = widget.contact.name;
    phoneController.text = widget.contact.phone;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      saveContactNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => debugPrint('saveContactNotifierProvider/ initial'),
          loading: () {
            debugPrint('saveContactNotifierProvider/ loading');
          },
          noConnection: () =>
              debugPrint('saveContactNotifierProvider/ noConnection'),
          success: (data) {
            debugPrint('saveContactNotifierProvider/ success');
            debugPrint('saveContactNotifierProvider/ $data');
            ref.read(contactNotifierProvider.notifier).getContacts();
            AutoRouter.of(context).pop();
          },
          error: (error) => debugPrint('saveContactNotifierProvider/ error'),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Enter your name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please type something';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please type something';
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: 'Enter your phone'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Contact contact = Contact(
                      id: widget.contact.id,
                      name: nameController.text,
                      phone: phoneController.text,
                      createdAt: DateTime.now().toString(),
                    );
                    ref
                        .read(saveContactNotifierProvider.notifier)
                        .updateContact(contact);
                  }
                },
                child: const Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
