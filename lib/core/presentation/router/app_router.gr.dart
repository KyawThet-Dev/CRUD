// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:crud/contact/domain/contact.dart' as _i12;
import 'package:crud/contact/presentation/add_contact_page.dart' as _i1;
import 'package:crud/contact/presentation/contact_page.dart' as _i2;
import 'package:crud/contact/presentation/update_contact_page.dart' as _i3;
import 'package:crud/contact/presentation/widgets/about.dart' as _i4;
import 'package:crud/contact/presentation/widgets/video_player.dart' as _i5;
import 'package:crud/customer/presentation/customer_page.dart' as _i10;
import 'package:crud/home/presentation/home.dart' as _i6;
import 'package:crud/product/presentation/product.dart' as _i7;
import 'package:crud/splash/presentation/splash_page.dart' as _i8;
import 'package:crud/wrapper_page.dart' as _i9;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddContactRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddContactPage(),
      );
    },
    ContactRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    UpdateContactRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateContactRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.UpdateContactPage(
          args.contact,
          key: args.key,
        ),
      );
    },
    AboutRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AboutPage(),
      );
    },
    PlayerRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PlayerPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProductPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashPage(),
      );
    },
    WrapperRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WrapperPage(),
      );
    },
    CustomerRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CustomerPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddContactPage]
class AddContactRoute extends _i11.PageRouteInfo<void> {
  const AddContactRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddContactRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ContactPage]
class ContactRoute extends _i11.PageRouteInfo<void> {
  const ContactRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UpdateContactPage]
class UpdateContactRoute extends _i11.PageRouteInfo<UpdateContactRouteArgs> {
  UpdateContactRoute({
    required _i12.Contact contact,
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          UpdateContactRoute.name,
          args: UpdateContactRouteArgs(
            contact: contact,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateContactRoute';

  static const _i11.PageInfo<UpdateContactRouteArgs> page =
      _i11.PageInfo<UpdateContactRouteArgs>(name);
}

class UpdateContactRouteArgs {
  const UpdateContactRouteArgs({
    required this.contact,
    this.key,
  });

  final _i12.Contact contact;

  final _i13.Key? key;

  @override
  String toString() {
    return 'UpdateContactRouteArgs{contact: $contact, key: $key}';
  }
}

/// generated route for
/// [_i4.AboutPage]
class AboutRoute extends _i11.PageRouteInfo<void> {
  const AboutRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PlayerPage]
class PlayerRoute extends _i11.PageRouteInfo<void> {
  const PlayerRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PlayerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProductPage]
class ProductRoute extends _i11.PageRouteInfo<void> {
  const ProductRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WrapperPage]
class WrapperRoute extends _i11.PageRouteInfo<void> {
  const WrapperRoute({List<_i11.PageRouteInfo>? children})
      : super(
          WrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'WrapperRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CustomerPage]
class CustomerRoute extends _i11.PageRouteInfo<void> {
  const CustomerRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
