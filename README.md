
# Donut Shop App Setup Instructions

## Prerequisites
- Install [Flutter](https://docs.flutter.dev/get-started/install) SDK
- Install [Dart](https://dart.dev/get-dart) (comes with Flutter)
- Install Android Studio or VS Code (recommended)
- Ensure you have a device/emulator for testing

## Getting Started
1. **Clone the repository**
	 ```sh
	 git clone <your-repo-url>
	 cd testA
	 ```
2. **Install dependencies**
	 ```sh
	 flutter pub get
	 ```
3. **Run the app**
	 - For Android:
		 ```sh
		 flutter run
		 ```
	 - For iOS (Mac only):
		 ```sh
		 flutter run
		 ```
	 - For Web:
		 ```sh
		 flutter run -d chrome
		 ```

## Project Structure
- `lib/` - Main source code
	- `main.dart` - App entry point
	- `models/` - Data models (e.g., Donut)
	- `pages/` - Main screens/pages (Home, Cart, Details, Favorites, etc.)
	- `widgets/` - Reusable UI components
- `assets/` - Images and icons
- `pubspec.yaml` - Dependency and asset configuration


## User Manual

Welcome to the Donut Shop App! This guide will help you get started and make the most of your experience.

### Home Page
When you open the app, you'll see the stylish "Donut Shop App" title at the top, followed by product categories such as Donuts, Burgers, Frappes, Juices, Pizzas, Breads, and Packs. Tap any category to view its products.

### Viewing Products
Products are displayed in a grid or list format. Tap on any product to see detailed information, including its description, ingredients, preparation, nutritional info, origin, allergens, and serving size. Swipe or scroll to explore more products.

### Adding to Cart
To purchase an item, tap the cart icon on the product detail page or from the product tile. You can view your cart at any time by tapping the cart icon in the app bar. Adjust quantities or remove items as needed before checkout.

### Favorites
Mark products as favorites by tapping the heart icon. Access your favorite products from the Favorites page for quick viewing and easy ordering.

### Switching Views
Use the grid/list toggle to change how products are displayed for easier browsing.

### Fullscreen Images
Tap on any product image to view it in fullscreen mode. Pinch to zoom and swipe to close.

### Checkout
Review your cart and proceed to checkout when ready. Follow the on-screen instructions to complete your order.

### Language
All product information and UI texts are in English for easy understanding.

### Help & Support
If you encounter any issues or have questions, refer to the Flutter documentation or contact support through the repository's issue tracker.

Enjoy exploring and ordering from the Donut Shop App!
