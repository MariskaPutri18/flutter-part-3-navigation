class Item {
  final String name; 
  final int price; 
  final String photo; // Atribut baru
  final int stock;   // Atribut baru
  final double rating; // Atribut baru

  Item({
    required this.name, 
    required this.price, 
    required this.photo, 
    required this.stock, 
    required this.rating,
  });
}