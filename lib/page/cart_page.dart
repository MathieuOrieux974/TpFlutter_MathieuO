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
                ? EmptyCart()
                : ListCart(listArticles: cart.listArticles);
          },
        ));
  }
}

class ListCart extends StatelessWidget {
  final List<Article> listArticles;
  const ListCart({super.key, required this.listArticles});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Votre panier toal est de "),
              Text(
                "0.00€",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
