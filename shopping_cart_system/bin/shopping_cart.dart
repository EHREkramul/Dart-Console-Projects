import 'product.dart';

class ShoppingCart{
  Map<Product, int> cartItems = {};

  void addProduct(Product product, int quantity) {
    if(!product.isInStock()){ throw Exception('Product Stock Out'); }
    else if(quantity > product.stockQuantity){ throw Exception('Not enough stock available'); }
    else{
      if(cartItems.containsKey(product)){
        cartItems[product] = cartItems[product]! + quantity;
      }else{
        cartItems[product] = quantity;
      }
      product.reduceStock(quantity);
    }
  }

  void removeProduct(Product product, int quantity) {
    if(!cartItems.containsKey(product)){
      throw Exception('Product not found');
    }
    else if(cartItems[product]! < quantity){
      product.addStock(cartItems[product]!);
      cartItems.remove(product);
    }else{
      cartItems[product] = cartItems[product]! - quantity;
      product.addStock(quantity);
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.00;
    cartItems.forEach((product, quantity) {
      totalPrice += product.price * quantity;
    });

    return totalPrice;
  }

  Future<void> checkout() async {
    print('Processing Checkout...');
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    cartItems.clear();
    print('Checkout Complete!');
  }

  void showCart(){
    if(cartItems.isEmpty){
      print('Cart is Empty');
    }else{
      cartItems.forEach((product, quantity) {
        print('${product.name} - Quantity: $quantity - Price: ${quantity * product.price}');
      });
    }

    print('Total Price: ${calculateTotalPrice()} USD');
  }
}