import 'package:flutter/material.dart';
import 'package:flutter_provider/src/controller/heroes_controller.dart';
import 'package:flutter_provider/src/pages/home_page.dart';
import 'package:provider/provider.dart';

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroesController>.value(value: HeroesController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teste Provider',
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.blueAccent,
        ),
        home: HomePage(),
      ),
    );
  }
}
