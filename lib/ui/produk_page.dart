import 'package:flutter/material.dart';
import 'produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final List<Map<String, String>> _produkList = [
    {
      'nama': 'Produk 1',
      'harga': '10000',
      'deskripsi': 'Deskripsi produk 1',
    },
    {
      'nama': 'Produk 2',
      'harga': '20000',
      'deskripsi': 'Deskripsi produk 2',
    },
    {
      'nama': 'Produk 3',
      'harga': '30000',
      'deskripsi': 'Deskripsi produk 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _produkList.length,
        itemBuilder: (context, index) {
          final produk = _produkList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(produk['nama']!),
              subtitle: Text('Rp ${produk['harga']}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProdukPage(
                      namaProduk: produk['nama']!,
                      hargaProduk: produk['harga']!,
                      deskripsi: produk['deskripsi']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProdukForm()),
          );
        },
        tooltip: 'Tambah Produk',
        child: const Icon(Icons.add),
      ),
    );
  }
}
