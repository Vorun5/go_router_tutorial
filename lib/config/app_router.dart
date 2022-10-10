import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_route_tutorial/cubits/login_cubit.dart';
import 'package:go_route_tutorial/screens/category_screen.dart';
import 'package:go_route_tutorial/screens/login_screen.dart';
import 'package:go_route_tutorial/screens/product_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final LoginCubit loginCubit;

  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      routerNeglect: true,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: ((BuildContext context, GoRouterState state) =>
              const LoginScreen()),
        ),
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) =>
              const CategoryScreen(),
          routes: [
            GoRoute(
              path: 'product_list/:category',
              name: 'product_list',
              builder: (BuildContext context, GoRouterState state) =>
                  ProductListScreen(
                category: state.params['category']!,
                asc: state.queryParams['sort'] == 'asc',
                quantity: int.parse(state.queryParams['filter'] ?? '0'),
              ),
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        final bool loggedIn = loginCubit.state.status == AuthStatus.auth;

        final bool loggingIn = state.subloc == '/login';

        // если пользователь не зареган
        if (!loggedIn) {
          // и уже находися на '/login', то ничего не делаем иначе перенаправляем на '/login'
          return loggingIn ? null : '/login';
        }

        // это может произойти только если пользователь зареган, то тогда мы кидаем его на главную странице
        if (loggingIn) {
          return '/';
        }

        return null;
      },
      refreshListenable: GoRouterRefreshStream(loginCubit.stream));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
