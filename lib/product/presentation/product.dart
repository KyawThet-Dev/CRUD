import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:crud/home/shared/music_notifier_provider.dart';
import 'package:crud/product/domain/product_model.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    Future.microtask(() async {
      await ref.read(productNotifierProvider.notifier).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productNotifierProvider);
    ref.listen(productNotifierProvider, (pre, next) {
      next.maybeWhen(
          orElse: () {},
          loading: () => const CircularProgressIndicator(),
          success: (data) {
            products = data;
          });
    });
    ref.listen(deleteMusicNotifierProvider, (pre, next) {
      next.maybeWhen(
          orElse: () {},
          success: (success) {
            ref.read(productNotifierProvider.notifier).getProducts();
          });
    });
    return Scaffold(
        body: state.maybeWhen(
      orElse: () {},
      loading: () => const Center(child: CircularProgressIndicator()),
      success: (data) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(products[index].name),
                trailing: IconButton(
                    onPressed: () {
                      ref
                          .read(deleteMusicNotifierProvider.notifier)
                          .deleteProduct(products[index].id);
                      setState(() {
                        products.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          }),
    ));
  }
}
