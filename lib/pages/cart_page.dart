import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

// Cart page: shows products added to the shopping cart
class CartPage extends StatelessWidget {
  // Displays the shopping cart with products, quantities, and total price
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    return Scaffold(
  appBar: AppBar(title: const Text("🛒 Cart")),
      body: Column(
        children: [
            Expanded(
              child: ListView.separated(
                itemCount: cart.lines.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final line = cart.lines[index];
                  return ListTile(
                    leading: Image.asset(line.donut.imagePath, width: 48, height: 48),
                    title: Text(line.donut.name),
                    subtitle: Text("${line.quantity} × \$${line.donut.price.toStringAsFixed(2)} = \$${line.lineTotal.toStringAsFixed(2)}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () => cart.decrement(line.donut.heroTag), icon: const Icon(Icons.remove_circle_outline)),
                        IconButton(onPressed: () => cart.add(line.donut), icon: const Icon(Icons.add_circle_outline)),
                        IconButton(icon: const Icon(Icons.delete_outline), onPressed: () => cart.remove(line.donut.heroTag)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$${cart.total.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: cart.lines.isEmpty ? null : () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                    child: const Text('Checkout'),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
