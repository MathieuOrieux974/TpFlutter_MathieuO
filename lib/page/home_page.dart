import 'package:flutter/material.dart';

import '../bo/article.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final listArticles = <Article>[
    Article(
        nom: "MBP",
        description: "Ordinateur LowCost",
        categorie: "Ordinateur Accessible",
        image:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp16-spaceblack-select-202310?wid=904&hei=840&fmt=jpeg&qlt=95&.v=1697311054290",
        prix: 424900),
    Article(
        nom: "MBP 18",
        description: "Ordinateur LowCost",
        categorie: "Ordinateur Accessible",
        image:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp16-spaceblack-select-202310?wid=904&hei=840&fmt=jpeg&qlt=95&.v=1697311054290",
        prix: 494900),
    Article(
        nom: "Dell XPS",
        description: "Ordinateur Un peu plus low cost",
        categorie: "Ordinateur Accessible",
        image:
            "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/xps-notebooks/xps-15-9530/media-gallery/touch-black/notebook-xps-15-9530-t-black-gallery-1.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=654&qlt=100,1&resMode=sharp2&size=654,402&chrss=full",
        prix: 244900),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listArticles.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(listArticles[index].nom),
                subtitle: Text(listArticles[index].getPrixEuro()),
                leading: Image.network(
                  listArticles[index].image,
                  width: 80,
                ),
                trailing: TextButton(
                  child: Text("AJOUTER"),
                  onPressed: () {},
                ),
              )),
    );
  }
}
