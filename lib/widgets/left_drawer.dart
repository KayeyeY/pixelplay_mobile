import 'package:flutter/material.dart';
import 'package:pixelplay_mobile/screens/list_product.dart';
import 'package:pixelplay_mobile/screens/menu.dart';
import 'package:pixelplay_mobile/screens/shoplist_form.dart';
import 'package:pixelplay_mobile/screens/view_item.dart';
// TODO: Impor halaman ShopFormPage jika sudah dibuat

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan belanjamu di sini!",
                    // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {

              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => ShopFormPage())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_outlined),
            title: const Text('Lihat Isi Tas'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LihatItem(itemList: Item.itemList)),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk'),
            onTap: () {
                // Route menu ke halaman produk
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}