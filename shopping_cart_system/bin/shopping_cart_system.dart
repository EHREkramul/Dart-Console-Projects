import 'product.dart';
import 'shopping_cart.dart';

void main() {
  // Create sample products
  Product product1 = Product(1, "Laptop", 1000.00, 10);
  Product product2 = Product(2, "Smartphone", 500.00, 5);
  Product product3 = Product(3, "Headphones", 100.00, 20);

  // Create the shopping cart
  ShoppingCart cart = ShoppingCart();

  // Add products to the cart
  try {
    cart.addProduct(product1, 2); // Add 2 laptops
    cart.addProduct(product2, 1); // Add 1 smartphone
    cart.addProduct(product3, 3); // Add 3 headphones
  } catch (e) {
    print("Error: $e");
  }

  // Show items in the cart
  print("\n--- Cart Items ---");
  cart.showCart();

  // Remove a product from the cart
  try {
    cart.removeProduct(product3, 1); // Remove 1 headphone
  } catch (e) {
    print("Error: $e");
  }

  // Show items in the cart again
  print("\n--- Updated Cart Items ---");
  cart.showCart();

  // Display total price
  print("\nTotal Price: \$${cart.calculateTotalPrice()}");

  // Perform checkout
  print("\n--- Checkout ---");
  cart.checkout().then((_) {
    print("\n--- Cart After Checkout ---");
    cart.showCart();
  });
}
