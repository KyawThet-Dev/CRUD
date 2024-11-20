import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:crud/core/presentation/router/app_router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [HomeRoute(), CustomerRoute(), ProductRoute()],
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Simple App',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25)),
          child: SalomonBottomBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                SalomonBottomBarItem(
                    icon: const Icon(Icons.home), title: const Text('Home')),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.list),
                    title: const Text('Customer')),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.production_quantity_limits_outlined),
                    title: const Text('Product'))
              ]),
        );
      },
    );
  }
}
