import 'package:assessment/features/groceries/presentation/pages/detail_page.dart';
import 'package:assessment/features/groceries/presentation/pages/my_basket_page.dart';
import 'package:flutter/material.dart';
import 'package:assessment/features/groceries/presentation/pages/splash_screen.dart';
import 'package:assessment/features/groceries/presentation/pages/home_page.dart';


class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String details = '/details';
  static const String mybasket = '/mybasket';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case details:
        final String id = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => DetailsPage(id: id));
      case mybasket:
        return MaterialPageRoute(builder: (_) => const MyBasketPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
