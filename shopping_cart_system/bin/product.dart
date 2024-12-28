class Product{
  Product(this.id, this.name, this.price, this.stockQuantity);

  late int id;
  late String name;
  late double price;
  late int stockQuantity;

  bool isInStock(){
    return stockQuantity > 0;
  }

  void reduceStock(int quantity){
    if(quantity <= stockQuantity){
      stockQuantity -= quantity;
    }else{
      throw Exception('Not enough stock available');
    }
  }

  void addStock(int quantity){
    if(quantity > 0) stockQuantity +=quantity;
  }
}