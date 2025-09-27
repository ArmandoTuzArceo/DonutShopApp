import 'package:flutter/material.dart';
import '../models/donut.dart';

import 'package:provider/provider.dart';
import '../main.dart';
import '../widgets/fullscreen_image_viewer.dart';

// Widget for displaying a product tile in grid or list view
class DonutTile extends StatelessWidget {
  // Displays a product tile (card) for grid or list view
  final Donut donut;
  final VoidCallback onTap;
  final bool isList;

  const DonutTile({
    super.key,
    required this.donut,
    required this.onTap,
    this.isList = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = Color(donut.backgroundColor);
    final Color badge = Color(donut.accentColor);

    if (isList) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  donut.imagePath,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      donut.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      donut.category,
                      style: const TextStyle(color: Colors.black45),
                    ),
                    Text(
                      "\$${donut.price.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Consumer<FavoritesModel>(
                builder: (context, favs, _) {
                  final isFav = favs.isFavorite(donut.heroTag);
                  return IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: Colors.pinkAccent,
                    ),
                    onPressed: () => favs.toggleFavorite(donut),
                  );
                },
              ),
              Consumer<CartModel>(
                builder: (context, cart, _) => IconButton(
                  icon: const Icon(Icons.add, color: Colors.black87),
                  onPressed: () => cart.add(donut),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              // price badge
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: badge,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "\$${donut.price.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // content
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullscreenImageViewer(
                                  imagePath: donut.imagePath,
                                  title: donut.name,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: donut.heroTag,
                            child: Image.asset(
                              donut.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      donut.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      donut.category,
                      style: const TextStyle(color: Colors.black45),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<FavoritesModel>(
                          builder: (context, favs, _) {
                            final isFav = favs.isFavorite(donut.heroTag);
                            return IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.pinkAccent,
                              ),
                              onPressed: () => favs.toggleFavorite(donut),
                            );
                          },
                        ),
                        Consumer<CartModel>(
                          builder: (context, cart, _) => IconButton(
                            icon: const Icon(Icons.add, color: Colors.black87),
                            onPressed: () => cart.add(donut),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
