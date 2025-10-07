import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menerima Map dari arguments
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final item = arguments['item'] as Item; // Item data
    final heroTag = arguments['tag'] as String; // Hero tag

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: heroTag,
              child: Image.asset( 
                item.photo,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 280,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 280,
                  color: Colors.grey,
                  child: const Center(child: Text('Gagal memuat aset', style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Harga: Rp ${item.price}',
                    style: const TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 24),
                          Text(
                            '${item.rating}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        'Stok Tersedia: ${item.stock}',
                        style: const TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Deskripsi Produk:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'produk ini adalah salah satu produk terbaik dengan kualitas unggul. Cocok untuk kebutuhan sehari-hari Anda. Dapatkan sekarang juga dan rasakan manfaatnya!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
 }
}