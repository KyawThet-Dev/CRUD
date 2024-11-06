import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      routes: const [HomeRoute(), ContactRoute()],
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Simple App',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          margin: EdgeInsets.only(left: 30, right: 30),
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
                    icon: const Icon(Icons.add), title: const Text('Add'))
              ]),
        );
      },
    );
  }
}
