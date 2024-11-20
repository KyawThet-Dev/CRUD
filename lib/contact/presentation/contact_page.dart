import 'package:auto_route/auto_route.dart';
import 'package:crud/core/presentation/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:crud/contact/domain/contact.dart';
import 'package:crud/contact/shared/contact_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

@RoutePage()
class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ContactPage>
    with SingleTickerProviderStateMixin {
  List<Contact> contactList = [];
  Contact? data;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getContacts();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  Future<void> getContacts() async {
    Future.microtask(
        () => ref.read(contactNotifierProvider.notifier).getContacts());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactNotifierProvider);
    ref.listen(
      contactNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => debugPrint('contactNotifierProvider/ initial'),
          loading: () {
            debugPrint('contactNotifierProvider/ loading');
          },
          noConnection: () =>
              debugPrint('contactNotifierProvider/ noConnection'),
          empty: () => debugPrint('contactNotifierProvider/ empty'),
          success: (data) {
            debugPrint('contactNotifierProvider/ success');
            debugPrint('contactNotifierProvider/ $data');
            contactList = data;
          },
          error: (error) => debugPrint('contactNotifierProvider/ error'),
        );
      },
    );
    ref.listen(saveContactNotifierProvider, (pre, next) {
      next.maybeWhen(
          orElse: () {},
          success: (data) {
            nameController.clear();
            phoneNumberController.clear();
            ref.read(contactNotifierProvider.notifier).getContacts();
          });
    });
    return Scaffold(
      body: state.when(
        initial: () => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        noConnection: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No Connection\nCheck your internet!',
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () => getContacts(),
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),
        empty: () => const Center(child: Text('No Data')),
        success: (contacts) => RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () => getContacts(),
          child: ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Card(
                child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('${index + 1}')),
                    title: Text(contactList[index].name),
                    subtitle: Text(contactList[index].phone),
                    trailing: IconButton(
                        onPressed: () async {
                          await ref
                              .read(saveContactNotifierProvider.notifier)
                              .deleteContact(contactList[index].id);
                          setState(() {
                            contactList.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    onTap: () => _showDialog(context, contactList[index])),
              ),
            ),
          ),
        ),
        error: (error) => const Center(
          child: Text('Error/nSomething wrong'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _showDialog(context, null);
            context.router.push(const AboutRoute());
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }

  _showDialog(ctx, Contact? contact) {
    if (contact != null) {
      nameController.text = contact.name;
      phoneNumberController.text = contact.phone;
    } else {
      nameController.clear();
      phoneNumberController.clear();
    }
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Form(
                key: formKey,
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
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Enter your name',
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
                      TextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please type something';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter your phone',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)))),
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (contact != null) {
                          Contact updateContact = Contact(
                              id: contact.id,
                              name: nameController.text,
                              phone: phoneNumberController.text,
                              createdAt: DateTime.now().toString());
                          ref
                              .read(saveContactNotifierProvider.notifier)
                              .updateContact(updateContact);
                        } else {
                          ref
                              .read(saveContactNotifierProvider.notifier)
                              .addContact(nameController.text,
                                  phoneNumberController.text);
                        }
                      }
                    },
                    child: const Text('Submit'))
              ],
            ));
  }
}
