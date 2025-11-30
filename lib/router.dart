import 'package:apparence_kit/core/bottom_menu/bottom_menu.dart';
import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/guards/authenticated_guard.dart';
import 'package:apparence_kit/core/widgets/page_not_found.dart';
import 'package:apparence_kit/modules/authentication/ui/recover_password_page.dart';
import 'package:apparence_kit/modules/authentication/ui/signin_page.dart';
import 'package:apparence_kit/modules/authentication/ui/signup_page.dart';
import 'package:apparence_kit/modules/subscription/ui/premium_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) => generateRouter(),
);

extension GoRouterRiverpod on Ref {
  GoRouter get goRouter => read(goRouterProvider);
}

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter generateRouter({
  String? initialLocation,
  List<GoRoute>? additionalRoutes,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) => const PageNotFound(),
    observers: [
      AnalyticsObserver(
        analyticsApi: MixpanelAnalyticsApi.instance(),
      ),
      
      ...?observers,
    ],
    routes: [
      // Home - requires authentication, redirects to signin if not logged in
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const AuthenticatedGuard(
          fallbackRoute: '/signin',
          child: BottomMenu(),
        ),
      ),
      // Auth routes
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: 'signin',
        path: '/signin',
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        name: 'recover_password',
        path: '/recover_password',
        builder: (context, state) => const RecoverPasswordPage(),
      ),
      // Premium/Subscription
      GoRoute(
        name: 'premium',
        path: '/premium',
        builder: (context, state) => const PremiumPage(),
      ),
      // 404
      GoRoute(
        name: '404',
        path: '/404',
        builder: (context, state) => const PageNotFound(),
      ),
    ],
  );
}

