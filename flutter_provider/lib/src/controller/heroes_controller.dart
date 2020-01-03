import 'package:flutter/foundation.dart';
import 'package:flutter_provider/src/model/hero_model.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Batman'),
    HeroModel(name: 'Spider-man'),
    HeroModel(name: 'Super-man'),
    HeroModel(name: 'Iron Man')
  ];

  checkFavorite(HeroModel model) {
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }

  int get countFavorite => heroes.where((index) => index.isFavorite).length;
}
