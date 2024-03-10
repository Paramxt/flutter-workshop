import 'package:auto_route/auto_route.dart';
import 'package:flutter_workshop/router/routes.gr.dart';

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
            path: '/login',
            page: LoginRoute.page,
            transitionsBuilder: TransitionsBuilders.slideTop),
        CustomRoute(
            path: '/example',
            page: ExampleRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft)
      ];
}
