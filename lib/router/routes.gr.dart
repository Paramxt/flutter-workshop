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

import 'package:flutter_workshop/screen/v2_SignIn.dart' as _i3;
import 'package:flutter_workshop/screen/v2_SignUp.dart' as _i5;
import 'package:flutter_workshop/screen/v2_HomeDevice.dart' as _i8;
import 'package:flutter_workshop/screen/setting.dart' as _i10;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AdddeviceRoute.name: (routeData) {
      final args = routeData?.argsAs<AdddeviceRouteArgs>() ??
          AdddeviceRouteArgs(countDevice: 0);
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AdddevicePage(countDevice: args.countDevice),
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
    SignUp2Route.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUp2Page(),
      );
    },
    HomeDeviceRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDeviceRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HomeDevicePage(countDevice: args.countDevice),
      );
    },
    SettingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdddevicePage]
class AdddeviceRoute extends _i6.PageRouteInfo<AdddeviceRouteArgs> {
  AdddeviceRoute({required int countDevice, List<_i6.PageRouteInfo>? children})
      : super(
          AdddeviceRoute.name,
          args: AdddeviceRouteArgs(countDevice: countDevice),
          initialChildren: children,
        );

  static const String name = 'AdddeviceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

class AdddeviceRouteArgs {
  final int countDevice;

  AdddeviceRouteArgs({required this.countDevice});
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
/// [_i8.HomeDevicePage]
class HomeDeviceRoute extends _i6.PageRouteInfo<HomeDeviceRouteArgs> {
  HomeDeviceRoute({required int countDevice, List<_i6.PageRouteInfo>? children})
      : super(
          HomeDeviceRoute.name,
          args: HomeDeviceRouteArgs(countDevice: countDevice),
          initialChildren: children,
        );

  static const String name = 'HomeDeviceRoute';

  static const _i6.PageInfo<HomeDeviceRouteArgs> page =
      _i6.PageInfo<HomeDeviceRouteArgs>(name);
}

class HomeDeviceRouteArgs {
  final int countDevice;

  HomeDeviceRouteArgs({required this.countDevice});
}

/// generated route for
/// [_i10.SettingPage]
class SettingRoute extends _i6.PageRouteInfo<void> {
  const SettingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
