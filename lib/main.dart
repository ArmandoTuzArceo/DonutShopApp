// Main entry point for the Donut Shop App
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

import 'pages/cart_page.dart';
import 'models/donut.dart';

// Manages the user's favorite products
class FavoritesModel extends ChangeNotifier {
  final Set<String> _favoriteIds = {};

  bool isFavorite(String id) => _favoriteIds.contains(id);

  void toggleFavorite(Donut donut) {
    final id = donut.heroTag;
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }

  List<String> get favoriteIds => _favoriteIds.toList();
}

// Represents a line item in the shopping cart
class CartLine {
  final Donut donut;
  int quantity;
  CartLine({required this.donut, this.quantity = 1});
  double get lineTotal => donut.price * quantity;
}

// Manages the shopping cart state and logic
class CartModel extends ChangeNotifier {
  final Map<String, CartLine> _linesById = {};

  List<CartLine> get lines => _linesById.values.toList(growable: false);
  int get itemCount => _linesById.values.fold(0, (s, l) => s + l.quantity);
  double get total => _linesById.values.fold(0.0, (s, l) => s + l.lineTotal);

  void add(Donut donut) {
    final id = donut.heroTag;
    final existing = _linesById[id];
    if (existing == null) {
      _linesById[id] = CartLine(donut: donut, quantity: 1);
    } else {
      existing.quantity += 1;
    }
    notifyListeners();
  }

  void decrement(String id) {
    final existing = _linesById[id];
    if (existing == null) return;
    existing.quantity -= 1;
    if (existing.quantity <= 0) {
      _linesById.remove(id);
    }
    notifyListeners();
  }

  void remove(String id) {
    _linesById.remove(id);
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => FavoritesModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
          textTheme: const TextTheme(titleLarge: TextStyle(fontWeight: FontWeight.bold)),
        ),
        home: HomePage(),
        routes: {
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
