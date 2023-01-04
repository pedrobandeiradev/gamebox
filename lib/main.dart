import 'package:flutter/material.dart';
import 'src/presenter/home/pages/home_index.dart';
import 'src/presenter/details/pages/details_index.dart';

void main() {
  runApp(const GameBox());
}

class GameBox extends StatelessWidget {
  const GameBox({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamebox - The Free-To-Play Games Database',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.builder,
      initialRoute: Routes.home,
    );
  }
}

class Routes {
  static Map<String, WidgetBuilder> builder = {
    Routes.home: (context) => const HomePage(),
    Routes.details: (context) => const DetailsPage(),
  };

  static const String home = '/home', details = '/details';
}
