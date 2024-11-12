import 'env.dart';

enum Flavors { prod, uat }

class F {
  static Flavors? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavors.prod:
        return 'CRUD APP';
      case Flavors.uat:
        return 'CRUD UAT';
      default:
        return 'CRUD';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavors.prod:
        return Env.prodUrl;
      case Flavors.uat:
        return Env.baseUrl;
      default:
        return Env.baseUrl;
    }
  }
}
