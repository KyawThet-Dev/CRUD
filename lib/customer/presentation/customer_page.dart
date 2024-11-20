import 'package:auto_route/auto_route.dart';
import 'package:crud/contact/presentation/widgets/show_dialog.dart';
import 'package:crud/customer/domian/customer_model.dart';
import 'package:crud/customer/shared/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CustomerPage extends ConsumerStatefulWidget {
  const CustomerPage({super.key});

  @override
  ConsumerState<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends ConsumerState<CustomerPage> {
  List<CustomerModel> customer = [];
  @override
  void initState() {
    super.initState();
    getCustomer();
  }

  Future<void> getCustomer() async {
    Future.microtask(() {
      ref.read(getAllCustomerNotiferProvider.notifier).getAllCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getAllCustomerNotiferProvider);
    ref.listen(getAllCustomerNotiferProvider, (pre, next) {
      next.maybeWhen(
          orElse: () {},
          loading: () => CircularProgressIndicator(),
          error: (error) => debugPrint('customer error :$error'),
          success: (data) {
            customer = data;
          });
    });
    return Scaffold(
      body: state.maybeWhen(
          orElse: () {},
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) => ListView.builder(
              itemCount: customer.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    trailing: Text(customer[index].customerName),
                  ),
                );
              })),
    );
  }
}
