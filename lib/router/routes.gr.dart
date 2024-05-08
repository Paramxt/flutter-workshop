// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter_workshop/screen/Adddevice.dart' as _i1;
import 'package:flutter_workshop/screen/example.dart' as _i2;
import 'package:flutter_workshop/screen/Mainhome.dart' as _i4;
import 'package:flutter_workshop/screen/v2_SignIn.dart' as _i3;
import 'package:flutter_workshop/screen/v2_SignUp.dart' as _i5;
import 'package:flutter_workshop/screen/v2_HomeDevice.dart' as _i7;
import 'package:flutter_workshop/screen/v2_HomeScreen.dart' as _i8;
import 'package:flutter_workshop/screen/Machine1.dart' as _i9;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AdddeviceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdddevicePage(),
      );
    },
    ExampleRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExamplePage(),
      );
    },
    Login2Route.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Login2Page(),
      );
    },
    MainhomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainhomePage(),
      );
    },
    SignUp2Route.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUp2Page(),
      );
    },
    HomeDeviceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeDevicePage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeScreenPage(),
      );
    },
    MachineRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MachinePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdddevicePage]
class AdddeviceRoute extends _i6.PageRouteInfo<void> {
  const AdddeviceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AdddeviceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdddeviceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExamplePage]
class ExampleRoute extends _i6.PageRouteInfo<void> {
  const ExampleRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Login2Page]
class Login2Route extends _i6.PageRouteInfo<void> {
  const Login2Route({List<_i6.PageRouteInfo>? children})
      : super(
          Login2Route.name,
          initialChildren: children,
        );

  static const String name = 'Login2Route';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainhomePage]
class MainhomeRoute extends _i6.PageRouteInfo<void> {
  const MainhomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainhomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainhomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUp2Page]
class SignUp2Route extends _i6.PageRouteInfo<void> {
  const SignUp2Route({List<_i6.PageRouteInfo>? children})
      : super(
          SignUp2Route.name,
          initialChildren: children,
        );

  static const String name = 'SignUp2Route';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeDevicePage]
class HomeDeviceRoute extends _i6.PageRouteInfo<void> {
  const HomeDeviceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeDeviceRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDeviceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreenPage]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MachinePage]
class MachineRoute extends _i6.PageRouteInfo<void> {
  const MachineRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MachineRoute.name,
          initialChildren: children,
        );

  static const String name = 'MachineRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
