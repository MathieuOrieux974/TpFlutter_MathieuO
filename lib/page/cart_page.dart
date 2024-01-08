import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bo/article.dart';
import '../bo/cart.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final List<Article> listArticles = <Article>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("EPSI Shop"),
        ),
        body: Consumer<Cart>(
          builder: (BuildContext context, Cart cart, Widget? child) {
            return cart.listArticles.isEmpty
                ? const EmptyCart()
                : ListCart(
                    listArticles: cart.listArticles,
                    prixEuro: cart.getTotalPrice(),
                  );
          },
        ));
  }
}

class ListCart extends StatelessWidget {
  final List<Article> listArticles;
  final String prixEuro;
  const ListCart({
    required this.listArticles,
    required this.prixEuro,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Votre panier toal est de "),
                Text(
                  prixEuro,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: listArticles.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(listArticles[index].nom),
                      subtitle: Text(listArticles[index].getPrixEuro()),
                      leading: Image.network(
                        listArticles[index].image,
                        width: 80,
                      ),
                      trailing: TextButton(
                        child: Text("SUPPRIMER"),
                        onPressed: () {
                          context.read<Cart>().remove(listArticles[index]);
                        },
                      ),
                    )),
          ),
        ],
      );
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Votre panier est actuellement vide"),
                Icon(Icons.image)
              ],
            ),
          )
        ],
      ),
    );
  }
}
