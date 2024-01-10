class Article {
  String nom;
  String description;
  String categorie;
  final String image;
  //num ou int en cents
  int prix;

  Article({
    required this.nom,
    required this.description,
    required this.categorie,
    required this.image,
    required this.prix,
  });
  getPrixEuro() => "${prix / 100}€";

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'description': this.description,
      'categorie': this.categorie,
      'image': this.image,
      'prix': this.prix,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      nom: map['title'] as String,
      description: map['description'] as String,
      categorie: map['category'] as String,
      image: map['image'] as String,
      prix: ((map['price'] as num) * 100).floor(),
    );
  }
}

void main() {
  final listArticles = <Article>[
    Article(
        nom: "MBP",
        description: "Ordinateur LowCost",
        categorie: "Ordinateur Accessible",
        image:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp16-spaceblack-select-202310?wid=904&hei=840&fmt=jpeg&qlt=95&.v=1697311054290",
        prix: 424900)
  ];
  print("L'article ${listArticles[0].nom} est "
      "en vente à  ${listArticles[0].getPrixEuro()}");
  //Créer une liste d'articles
  //print un article avec son nom et son prix
}
