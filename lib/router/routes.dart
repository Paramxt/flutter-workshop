import 'package:auto_route/auto_route.dart';
import 'package:flutter_workshop/router/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            path: '/mainhome',
            page: MainhomeRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/adddevice',
            page: AdddeviceRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/signinv2',
            page: Login2Route.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/signupv2',
            page: SignUp2Route.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/homescreen',
            page: HomeScreenRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/examplev2',
            page: ExampleRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/homedevice',
            page: HomeDeviceRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            path: '/machine',
            page: MachineRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
      ];
}
