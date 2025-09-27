import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/donut.dart';
import '../widgets/donut_tile.dart';
import 'details_page.dart';

// Favorites page: displays the user's favorite products
class FavoritesPage extends StatelessWidget {
  // Displays the list of favorite products selected by the user
  final List<Donut> allProducts;
  const FavoritesPage({super.key, required this.allProducts});

  @override
  Widget build(BuildContext context) {
    final favs = context.watch<FavoritesModel>();
    final favDonuts = allProducts.where((d) => favs.isFavorite(d.heroTag)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: favDonuts.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favDonuts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final donut = favDonuts[index];
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
                  isList: true,
                );
              },
            ),
    );
  }
}
