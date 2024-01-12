import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.go('/cart'),
              icon: Badge(
                  //On affiche un badge par dessus l'icône avec le nombre d'articles
                  // dans le pânier
                  label: Text("${context.watch<Cart>().listArticles.length}"),
                  child: Icon(Icons.shopping_cart))),
          IconButton(
              onPressed: () => context.go('/aboutUs'),
              icon: Badge(
                  child: Icon(Icons.map_outlined)))
        ],
      ),
      body: FutureBuilder<List<Article>>(
          future: fetchListProducts(),
          builder: (context, snapshot) => switch (snapshot.connectionState) {
                ConnectionState.done when snapshot.data != null =>
                  ListArticles(listArticles: snapshot.data!),
                ConnectionState.waiting =>
                  Center(child: const CircularProgressIndicator()),
                _ => const Icon(Icons.error)
              }),
    );
  }

  Future<List<Article>> fetchListProducts() async {
    String uri = "https://fakestoreapi.com/products";
    Response resListArt = await get(Uri.parse(uri));
    //Si la requête s'est bien passée et que le corps de la réponse
    // n'est pas vide
    if (resListArt.statusCode == 200 && resListArt.body.isNotEmpty) {
      final resListMap = jsonDecode(resListArt.body) as List<dynamic>;
      return resListMap
          .map<Article>((map) => Article.fromMap(map as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Requête invalide");
    }
  }
}

class ListArticles extends StatelessWidget {
  const ListArticles({
    super.key,
    required this.listArticles,
  });

  final List<Article> listArticles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listArticles.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () => context.go("/detail", extra: listArticles[index]),
              title: Text(listArticles[index].nom),
              subtitle: Text(listArticles[index].getPrixEuro()),
              leading: Image.network(
                listArticles[index].image,
                width: 80,
              ),
              trailing: TextButton(
                child: Text("AJOUTER"),
                onPressed: () {
                  context.read<Cart>().add(listArticles[index]);
                },
              ),
            ));
  }
}
