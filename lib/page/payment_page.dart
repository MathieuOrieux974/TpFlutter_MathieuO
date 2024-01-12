import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../bo/cart.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finalisation de la commande"),
      ),
      body: Recap(),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: null,
          child: Text("Procéder au paiement"),
        ),
      ),
    );
  }
}

class Recap extends StatelessWidget {
  Recap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200, // Définissez ici la hauteur souhaitée
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Récapitulatif de votre commande',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sous-Total'),
                        Text('${context.read<Cart>().getTotalPrice()}'),
                      ],
                    ),
                    SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vous économisez',
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          '-0.09€',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TVA'),
                        Text(
                            '${(context.read<Cart>().getTotalPriceD() * 0.2).toStringAsFixed(2)}€'),
                      ],
                    ),
                    SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${(context.read<Cart>().getTotalPriceD() + (context.read<Cart>().getTotalPriceD() * 0.2)).toStringAsFixed(2)}€',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text(
            'Adresse de livraison',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ), // Espace entre les deux Cards
          Container(
            height: 115, // Définissez ici la hauteur souhaitée
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Colonne à gauche
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Machin Bidulle',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '14 rue du mec perdu',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '9876654 Ouagadougou',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16), // Espace entre la colonne et le bouton
                    // Bouton à droite
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text(
            'Méthode de paiement',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),PaymentOptionsRow()
        ],
      ),
    );
  }
}
class PaymentOptionsRow extends StatefulWidget {
  @override
  _PaymentOptionsRowState createState() => _PaymentOptionsRowState();
}

class _PaymentOptionsRowState extends State<PaymentOptionsRow> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PaymentCard(
          icon: FontAwesomeIcons.applePay,
          label: 'Apple Pay',
          isSelected: selectedCardIndex == 0,
          onTap: () {
            setState(() {
              selectedCardIndex = 0;
            });
          },
        ),
        PaymentCard(
          icon: FontAwesomeIcons.ccVisa,
          label: 'Visa',
          isSelected: selectedCardIndex == 1,
          onTap: () {
            setState(() {
              selectedCardIndex = 1;
            });
          },
        ),
        PaymentCard(
          icon: FontAwesomeIcons.ccMastercard,
          label: 'Mastercard',
          isSelected: selectedCardIndex == 2,
          onTap: () {
            setState(() {
              selectedCardIndex = 2;
            });
          },
        ),
        PaymentCard(
          icon: FontAwesomeIcons.paypal,
          label: 'PayPal',
          isSelected: selectedCardIndex == 3,
          onTap: () {
            setState(() {
              selectedCardIndex = 3;
            });
          },
        ),
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 5.0 : 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected ? Colors.red : Theme.of(context).colorScheme.onSurface,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
