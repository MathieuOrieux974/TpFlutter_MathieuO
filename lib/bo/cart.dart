import 'package:flutter/foundation.dart';

import 'article.dart';

//Cette classe implémente le design pattern observer/Observable
//A chaque fois qu'elle va évolue , elle avertira
// les observeurs (ListCart, IconButton Cart dans Home)
class Cart with ChangeNotifier {
  final _listArticles = <Article>[];

  List<Article> get listArticles => _listArticles;

  void add(Article article) {
    _listArticles.add(article);
    notifyListeners();
  }

  void remove(Article article) {
    _listArticles.remove(article);
    notifyListeners();
  }

  void removeAll() {
    _listArticles.clear();
    notifyListeners();
  }
}
