import 'package:flutter/material.dart';
import 'package:flutter_provider/src/controller/heroes_controller.dart';
import 'package:flutter_provider/src/model/hero_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        actions: <Widget>[
          const Icon(Icons.favorite),
          Consumer<HeroesController>(builder: (context, heroesController, widget) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '${heroesController.countFavorite}',
                  style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
                ),
              ),
            );
          }),
        ],
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widge) {
          return _buildList();
        },
      ),
    );
  }

  _buildList() {
    var controller = Provider.of<HeroesController>(context);
    return ListView.builder(
      itemCount: controller.heroes.length,
      itemBuilder: (context, index) => _buildItem(controller.heroes[index]),
    );
  }

  _buildItem(HeroModel hero) {
    var controller = Provider.of<HeroesController>(context);
    return ListTile(
      onTap: () => controller.checkFavorite(hero),
      title: Text(hero.name),
      trailing: hero.isFavorite
          ? Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
            )
          : Icon(Icons.favorite_border),
    );
  }
}
