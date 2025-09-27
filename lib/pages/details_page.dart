// Product details page: shows all info cards for a selected product
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/donut.dart';
import '../main.dart';
import '../widgets/fullscreen_image_viewer.dart';

// Displays detailed information for a selected product
class DetailsPage extends StatelessWidget {
  final Donut donut;

  const DetailsPage({super.key, required this.donut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(donut.backgroundColor),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text(donut.name, style: const TextStyle(color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image with tap functionality
            GestureDetector(
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(donut.imagePath, height: 220),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Product name and price
            Text(
              donut.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text("\$${donut.price.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 22, color: Colors.pink)),
            const SizedBox(height: 10),
            
            // Description
            Text(donut.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            
            // Detailed information cards
            _buildInfoCard(
              title: "Ingredients",
              content: donut.ingredients.join(", "),
              icon: Icons.restaurant,
            ),
            const SizedBox(height: 12),
            
            _buildInfoCard(
              title: "Preparation Method",
              content: donut.preparationMethod,
              icon: Icons.construction,
            ),
            const SizedBox(height: 12),
            
            _buildInfoCard(
              title: "Nutritional Info",
              content: donut.nutritionalInfo.entries
                  .map((e) => "${e.key}: ${e.value}")
                  .join("\n"),
              icon: Icons.analytics,
            ),
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    title: "Time",
                    content: "${donut.preparationTime} min",
                    icon: Icons.timer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInfoCard(
                    title: "Serving",
                    content: donut.servingSize,
                    icon: Icons.person,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            _buildInfoCard(
              title: "Origin",
              content: donut.origin,
              icon: Icons.location_on,
            ),
            const SizedBox(height: 12),
            
            if (donut.allergens.isNotEmpty)
              _buildInfoCard(
                title: "Allergens",
                content: donut.allergens.join(", "),
                icon: Icons.warning,
                isWarning: true,
              ),
            
            const SizedBox(height: 30),
            
            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  context.read<CartModel>().add(donut);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart')),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Add to cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
    bool isWarning = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isWarning ? Colors.orange : Colors.pink,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isWarning ? Colors.orange : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
