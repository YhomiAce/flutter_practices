import 'package:boxed_app/models/user.dart';
import 'package:boxed_app/pages/gallery/gallery.dart';
import 'package:boxed_app/pages/go_router/home.dart';
import 'package:boxed_app/pages/go_router/login.dart';
import 'package:boxed_app/pages/go_router/pricing.dart';
import 'package:boxed_app/pages/go_router/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      builder: (context, child) {
        return Flexible(
          child: child!,
        );
      },
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/login",
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) => const GoHomePage(),
    ),
    GoRoute(
      path: "/login",
      name: "/login",
      builder: (context, state) => const GoLoginPage(),
    ),
    GoRoute(
      path: "/profile",
      name: "/profile",
      builder: (context, state) {
        final User user = state.extra as User;
        return ProfilePage(user: user);
      },
    ),
    GoRoute(
      path: "/pricing/:price",
      name: "/pricing",
      builder: (context, state) {
        final double amount = double.parse(state.pathParameters["price"]!);
        return PricingPage(amount: amount);
      },
    ),
    GoRoute(
      path: "/gallery",
      name: "/gallery",
      builder: (context, state) => const Gallery(),
    )
  ],
);
