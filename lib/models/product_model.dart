class Product {
  final String name;
  final String category;
  final int quantity;

  Product({required this.name, required this.category, required this.quantity});

  static List<Product> products = [
    Product(category: 'Food', name: 'Milk', quantity: 10),
    Product(category: 'Food', name: 'Rice', quantity: 5),
    Product(category: 'Food', name: 'Pasta', quantity: 20),
    Product(category: 'Food', name: 'Steak', quantity: 15),
    Product(category: 'Clothes', name: 'T-Shirt', quantity: 2),
    Product(category: 'Clothes', name: 'Jeans', quantity: 5),
    Product(category: 'Clothes', name: 'Shirt', quantity: 10),
    Product(category: 'Clothes', name: 'Skirt', quantity: 20),
  ];
}
