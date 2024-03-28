import 'package:auto_route/auto_route.dart';
import 'package:flutter_workshop/router/routes.gr.dart';
import 'package:flutter_workshop/screen/Mainhome.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            path: '/home',
            page: HomeRoute.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/signin',
            page: LoginRoute.page,
            transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
            path: '/example',
            page: ExampleRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/signup',
            page: SignUpRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/page0',
            page: MainhomeRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/page1',
            page: SettingRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/eiei',
            page: EieiRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft)
      ];
}
