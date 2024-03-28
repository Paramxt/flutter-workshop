// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter_workshop/screen/Adddevice.dart' as _i6;
import 'package:flutter_workshop/screen/eiei.dart' as _i8;
import 'package:flutter_workshop/screen/example.dart' as _i1;
import 'package:flutter_workshop/screen/home.dart' as _i2;
import 'package:flutter_workshop/screen/Mainhome.dart' as _i4;
import 'package:flutter_workshop/screen/Sensor.dart' as _i5;
import 'package:flutter_workshop/screen/SignIn.dart' as _i3;
import 'package:flutter_workshop/screen/SignUp.dart' as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    ExampleRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ExampleRoute(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeRoute(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    MainhomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainhomePage(),
      );
    },
    Route2Route.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Page2Page(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SettingPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignUpPage(),
      );
    },
    EieiRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.eieiPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ExampleRoute]
class ExampleRoute extends _i9.PageRouteInfo<void> {
  const ExampleRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeRoute]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainhomePage]
class MainhomeRoute extends _i9.PageRouteInfo<void> {
  const MainhomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainhomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainhomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Page2Page]
class Route2Route extends _i9.PageRouteInfo<void> {
  const Route2Route({List<_i9.PageRouteInfo>? children})
      : super(
          Route2Route.name,
          initialChildren: children,
        );

  static const String name = 'Route2Route';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SettingPage]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.eieiPage]
class EieiRoute extends _i9.PageRouteInfo<void> {
  const EieiRoute({List<_i9.PageRouteInfo>? children})
      : super(
          EieiRoute.name,
          initialChildren: children,
        );

  static const String name = 'EieiRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
