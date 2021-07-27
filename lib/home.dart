import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Card> _buildGridCards(BuildContext context) {
      List<Product> products = ProductsRepository.loadProducts(Category.all);

      if (products.isEmpty) {
        return const <Card>[];
      }

      final NumberFormat formatter = NumberFormat.simpleCurrency(
          locale: Localizations.localeOf(context).toString());

      return products.map((product) {
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(10),
          shadowColor: Colors.blueAccent,
          color: Colors.blueAccent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
          borderOnForeground: false,
          //  Adjust card heights (103)
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.black45),
                left: BorderSide(width: 2.0, color: Colors.black45),
                right: BorderSide(width: 2.0, color: Colors.black45),
                bottom: BorderSide(width: 2.0, color: Colors.black45),
              ),
            ),
            child: Column(
              // Center items on the card (103)
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18 / 11,
                  child: Image.asset(product.assetName,
                      package: product.assetPackage, fit: BoxFit.fitWidth
                      // Adjust the box size (102)
                      ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 12.0, 8.0),
                    child: Column(
                      // Align labels to the bottom and center (103)
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Change innermost Column (103)
                      children: <Widget>[
                        // Handle overflowing labels (103)
                        Text(
                          product.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          maxLines: 1,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          formatter.format(product.price),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print("Menu button");
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('SHRINE'),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  print("Search Button");
                },
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'search',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: IconButton(
              onPressed: () {
                print("Fliter button");
              },
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
    );
  }
}
