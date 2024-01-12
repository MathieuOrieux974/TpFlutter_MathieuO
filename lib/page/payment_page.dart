import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: const Text("Finalisation de la commande"),
    ),


    );
  }
}
class Recap extends StatelessWidget {
  const Recap({
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

