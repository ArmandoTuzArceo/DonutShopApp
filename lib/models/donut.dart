// Donut model: used for all product types (Donuts, Juices, Frappes, etc.)
class Donut {
  // Product name
  final String name;
  // Path to product image asset
  final String imagePath;
  // Price in local currency
  final double price;
  // Short description
  final String description;
  // Category key (Donuts, Juices, etc.)
  final String category;
  // Card background color
  final int backgroundColor;
  // Card accent color
  final int accentColor;
  // Hero animation tag for transitions
  final String heroTag;
  // List of ingredients
  final List<String> ingredients;
  // Preparation instructions
  final String preparationMethod;
  // Nutrition facts
  final Map<String, String> nutritionalInfo;
  // Preparation time in minutes
  final int preparationTime; // in minutes
  // Product origin or inspiration
  final String origin;
  // List of allergens
  final List<String> allergens;
  // Serving size description
  final String servingSize;

  // Constructor for Donut model
  Donut({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.category,
    required this.backgroundColor,
    required this.accentColor,
    required this.heroTag,
    required this.ingredients,
    required this.preparationMethod,
    required this.nutritionalInfo,
    required this.preparationTime,
    required this.origin,
    required this.allergens,
    required this.servingSize,
  });
}