import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: WrapperRoute.page, path: '/', children: [
      AutoRoute(page: HomeRoute.page, path: 'home'),
      AutoRoute(page: ContactRoute.page, path: 'contact'),
    ]),
    AutoRoute(page: ContactRoute.page, path: '/home'),
    AutoRoute(page: AddContactRoute.page, path: '/add'),
    AutoRoute(page: UpdateContactRoute.page, path: '/update'),
  ];
}
