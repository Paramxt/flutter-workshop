// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter_workshop/screen/Adddevice.dart' as _i1;
import 'package:flutter_workshop/screen/example.dart' as _i2;
import 'package:flutter_workshop/screen/setting.dart' as _i5;
import 'package:flutter_workshop/screen/v2_HomeDevice.dart' as _i3;
import 'package:flutter_workshop/screen/v2_SignIn.dart' as _i4;
import 'package:flutter_workshop/screen/v2_SignUp.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AdddeviceRoute.name: (routeData) {
      final args = routeData.argsAs<AdddeviceRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AdddevicePage(
          key: args.key,
          countDevice: args.countDevice,
        ),
      );
    },
    ExampleRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExamplePage(),
      );
    },
    HomeDeviceRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDeviceRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeDevicePage(
          key: args.key,
          countDevice: args.countDevice,
        ),
      );
    },
    Login2Route.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Login2Page(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingPage(),
      );
    },
    SignUp2Route.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUp2Page(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdddevicePage]
class AdddeviceRoute extends _i7.PageRouteInfo<AdddeviceRouteArgs> {
  AdddeviceRoute({
    _i8.Key? key,
    required int countDevice,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeDeviceRoute.name,
          args: AdddeviceRouteArgs(
            key: key,
            countDevice: countDevice,
          ),
          initialChildren: children,
        );

  static const String name = 'AdddeviceRoute';

  static const _i7.PageInfo<AdddeviceRouteArgs> page =
      _i7.PageInfo<AdddeviceRouteArgs>(name);
}

class AdddeviceRouteArgs {
  const AdddeviceRouteArgs({
    this.key,
    required this.countDevice,
  });

  final _i8.Key? key;

  final int countDevice;

  @override
  String toString() {
    return 'AdddeviceRouteArgs{key: $key, countDevice: $countDevice}';
  }
}

/// generated route for
/// [_i2.ExamplePage]
class ExampleRoute extends _i7.PageRouteInfo<void> {
  const ExampleRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeDevicePage]
class HomeDeviceRoute extends _i7.PageRouteInfo<HomeDeviceRouteArgs> {
  HomeDeviceRoute({
    _i8.Key? key,
    required int countDevice,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeDeviceRoute.name,
          args: HomeDeviceRouteArgs(
            key: key,
            countDevice: countDevice,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDeviceRoute';

  static const _i7.PageInfo<HomeDeviceRouteArgs> page =
      _i7.PageInfo<HomeDeviceRouteArgs>(name);
}

class HomeDeviceRouteArgs {
  const HomeDeviceRouteArgs({
    this.key,
    required this.countDevice,
  });

  final _i8.Key? key;

  final int countDevice;

  @override
  String toString() {
    return 'HomeDeviceRouteArgs{key: $key, countDevice: $countDevice}';
  }
}

/// generated route for
/// [_i4.Login2Page]
class Login2Route extends _i7.PageRouteInfo<void> {
  const Login2Route({List<_i7.PageRouteInfo>? children})
      : super(
          Login2Route.name,
          initialChildren: children,
        );

  static const String name = 'Login2Route';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingPage]
class SettingRoute extends _i7.PageRouteInfo<void> {
  const SettingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUp2Page]
class SignUp2Route extends _i7.PageRouteInfo<void> {
  const SignUp2Route({List<_i7.PageRouteInfo>? children})
      : super(
          SignUp2Route.name,
          initialChildren: children,
        );

  static const String name = 'SignUp2Route';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
