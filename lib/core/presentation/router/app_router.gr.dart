// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:crud/contact/domain/contact.dart' as _i8;
import 'package:crud/contact/presentation/add_contact_page.dart' as _i1;
import 'package:crud/contact/presentation/contact_page.dart' as _i2;
import 'package:crud/contact/presentation/update_contact_page.dart' as _i3;
import 'package:crud/home/presentation/home.dart' as _i4;
import 'package:crud/splash/presentation/splash_page.dart' as _i5;
import 'package:crud/wrapper_page.dart' as _i6;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AddContactRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddContactPage(),
      );
    },
    ContactRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    UpdateContactRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateContactRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.UpdateContactPage(
          args.contact,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
    WrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddContactPage]
class AddContactRoute extends _i7.PageRouteInfo<void> {
  const AddContactRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AddContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddContactRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ContactPage]
class ContactRoute extends _i7.PageRouteInfo<void> {
  const ContactRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.UpdateContactPage]
class UpdateContactRoute extends _i7.PageRouteInfo<UpdateContactRouteArgs> {
  UpdateContactRoute({
    required _i8.Contact contact,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          UpdateContactRoute.name,
          args: UpdateContactRouteArgs(
            contact: contact,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateContactRoute';

  static const _i7.PageInfo<UpdateContactRouteArgs> page =
      _i7.PageInfo<UpdateContactRouteArgs>(name);
}

class UpdateContactRouteArgs {
  const UpdateContactRouteArgs({
    required this.contact,
    this.key,
  });

  final _i8.Contact contact;

  final _i9.Key? key;

  @override
  String toString() {
    return 'UpdateContactRouteArgs{contact: $contact, key: $key}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WrapperPage]
class WrapperRoute extends _i7.PageRouteInfo<void> {
  const WrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          WrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'WrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
