import 'package:flutter/material.dart';
import '../models/donut.dart';
import '../widgets/donut_tile.dart';
import 'details_page.dart';

// All products page: displays every product available in the app
class AllProductsPage extends StatelessWidget {
  // Displays a grid or list of all products for browsing
  final List<Donut> products;

  const AllProductsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos los Productos"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final donut = products[index];
          return DonutTile(
            donut: donut,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(donut: donut),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
