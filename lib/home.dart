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

      final ThemeData theme = Theme.of(context);
      final NumberFormat formatter = NumberFormat.simpleCurrency(
          locale: Localizations.localeOf(context).toString());

      return products.map((product) {
        return Card(
          clipBehavior: Clip.antiAlias,
          //  Adjust card heights (103)
          child: Column(
            // Center items on the card (103)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 11,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  // Adjust the box size (102)
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    // Align labels to the bottom and center (103)
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Change innermost Column (103)
                    children: <Widget>[
                      // Handle overflowing labels (103)
                      Text(
                        product.name,
                        style: theme.textTheme.headline6,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
