import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

// Widget Baru: Untuk menampilkan Foto Produk 
class ProductPhoto extends StatelessWidget {
  final String photoPath;

  const ProductPhoto({super.key, required this.photoPath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
        child: Image.asset(
          photoPath,
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey,
            child: const Center(
              child: Text('No Image', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget Baru: Untuk menampilkan Nama, Harga, dan Stok
class ProductText extends StatelessWidget {
  final Item item;

  const ProductText({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
          child: Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Rp ${item.price}'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Text('Stok: ${item.stock}'),
        ),
      ],
    );
  }
}

// Widget Baru: Untuk menampilkan Rating
class ProductRating extends StatelessWidget {
  final double rating;

  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 16),
          Text('$rating'),
        ],
      ),
    );
  }
}
// Widget Item di GridView (menggunakan widget pembantu)
class ProductGridItem extends StatelessWidget {
  final Item item;
  final int index;

  const ProductGridItem({Key? key, required this.item, required this.index})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke ItemPage
        Navigator.pushNamed(context, '/item', arguments: {'item': item});
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menggunakan widget baru untuk Foto
            ProductPhoto(photoPath: item.photo),
            // Menggunakan widget baru untuk Teks/Detail
            ProductText(item: item),
            // Menggunakan widget baru untuk Rating
            ProductRating(rating: item.rating),
          ],
        ),
      ),
    );
  }
}

// Widget Footer Aplikasi
class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.shade200,
      width: double.infinity,
      child: const Column(
        children: [
          Text(
            'Nama: MARISKA PUTRI',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            'NIM: 2341760051',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// Halaman Utama Aplikasi
class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      photo: 'images/sugar.png',
      stock: 50,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      photo: 'images/salt.png',
      stock: 100,
      rating: 4.8,
    ),
    Item(
      name: 'Tea',
      price: 10000,
      photo: 'images/tea.png',
      stock: 30,
      rating: 4.2,
    ),
    Item(
      name: 'Coffee',
      price: 15000,
      photo: 'images/coffee.png',
      stock: 75,
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Marketplace")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, // Disesuaikan untuk tampilan item
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ProductGridItem(item: item, index: index);
              },
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
