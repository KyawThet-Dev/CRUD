import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_crud/contact/shared/contact_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AddContactPage extends ConsumerStatefulWidget {
  const AddContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddContactPageState();
}

class _AddContactPageState extends ConsumerState<AddContactPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        title: const Text('Add Contact'),
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
                    ref
                        .read(saveContactNotifierProvider.notifier)
                        .addContact(nameController.text, phoneController.text);
                  }
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
