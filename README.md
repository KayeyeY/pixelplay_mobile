# Nama : Kevin Yehezkiel Manurung
# Kelas : PBP - E
# NPM : 2206826974

### Readme tugas 7
**Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
    ``StatelessWidget`` digunakan untuk widget yang tidak perlu berubah atau memiliki state internal, sedangkan ``StatefulWidget`` digunakan untuk widget yang memerlukan pembaruan tampilan berdasarkan perubahan state.

**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**  
    - MyHomePage (StatelessWidget): Ini merupakan widget utama yang mewakili halaman beranda dalam aplikasi.  
    - Scaffold: Widget ini digunakan untuk menciptakan tata letak dasar aplikasi, termasuk AppBar (bilah atas) dan konten utama (body).  
    - AppBar: Widget ini mewakili bilah atas (app bar) dalam aplikasi dengan judul tertentu.  
    - SingleChildScrollView: Widget ini melingkupi konten utama untuk memungkinkan pengguliran jika kontennya lebih besar daripada layar.  
    - Padding: Widget ini digunakan untuk memberikan ruang jeda di sekitar kontennya.  
    - Column: Widget ini digunakan untuk mengatur anak-anaknya secara vertikal.  
    - Text: Widget ini digunakan untuk menampilkan teks dengan gaya tertentu.  
    - GridView.count: Widget ini digunakan untuk membuat tampilan grid dengan jumlah kolom yang ditentukan (3 kolom dalam kasus ini).  
    - ShopCard (StatelessWidget): Widget ini digunakan untuk mewakili setiap item toko (kartu) dalam grid. Ini menerima properti dari objek ShopItem dan menggambarkannya.  
    - Material: Widget ini digunakan untuk memberikan latar belakang warna untuk setiap ShopCard.  
    - InkWell: Widget ini digunakan untuk menciptakan area yang responsif terhadap sentuhan dan menampilkan SnackBar ketika kartu diklik.    
    - Icon: Widget ini digunakan untuk menampilkan ikon dengan warna putih.  

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**
- Buat program dengan cara:
    ```
    flutter create <APP_NAME>
    cd <APP_NAME>
    ```
- Buat menu.dart dan import pada main.dart
    ```
    import 'package:pixelplay_mobile/menu.dart';
    ```
- Isi file menu dart sesuai template dan ubah beberapa line sesuai keinginan
    ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Pixel Play Mobile',
                style: TextStyle(
                    color: Colors.white, // Mengatur warna teks menjadi putih
                ),
                ),
            ),
            body: SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                        'Menu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((ShopItem item) {
                        return ShopCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ),
            );
        }
        }

        class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
        }

        final List<ShopItem> items = [
        ShopItem("Lihat Produk", Icons.checklist),
        ShopItem("Tambah Produk", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
        ];

        class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: Colors.indigo,
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
    }
    ```

### Readme tugas 8
**Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**  
`Navigator.push` digunakan untuk menambahkan layar baru di atas layar yang ada di tumpukan navigasi. Ini memungkinkan pengguna untuk kembali ke layar sebelumnya dengan menekan tombol kembali. Cocok digunakan jika Anda ingin menambahkan layar baru dan memberi pengguna kemampuan untuk kembali ke layar sebelumnya.  

`Navigator.pushReplacement` digunakan untuk menambahkan layar baru ke tumpukan dan menggantikan layar yang ada di tumpukan dengan layar baru. Layar yang ada di bawah layar baru dihapus dari tumpukan, sehingga ketika pengguna menekan tombol kembali, mereka langsung kembali ke layar sebelumnya sebelum layar yang baru ditambahkan. Cocok digunakan jika Anda ingin menggantikan layar saat ini dengan layar baru dan tidak ingin pengguna kembali ke layar sebelumnya.  

**Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**  
`Container` : Digunakan untuk mengelompokkan widget lain dan mengatur terhadap layout attribute seperti margin dan padding.  
`Column` : Digunakan untuk menampilkan widget dalam susunan vertikal.  
`Row` : Digunakan untuk menampilkan widget dalam susunan horizontal.  
`ListView` : Digunakan untuk menampilkan daftar elemen scrollable.  
`Stack` : Digunakan untuk "menumpuk" widget satu di atas yang lain.  

**Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**  
`TextFormField()` dikarenakan pada tugas ini kita hanya menginput string dan integer

**Bagaimana penerapan clean architecture pada aplikasi Flutter?**
- Layer Domain:
    * Berfungsi sebagai tempat aturan bisnis atau logika inti aplikasi.
    * Tidak memiliki ketergantungan pada detail implementasi atau teknologi tertentu.
    * Menyertakan use case, entitas, dan repositori yang menentukan kontrak untuk mengakses data.

- Layer Data:
    * Bertanggung jawab atas pengambilan dan penyimpanan data.
    * Menyediakan implementasi repositori dan sumber data (API, database, dll.).
    * Bertindak sebagai perantara antara Domain Layer dan Presentation Layer.

- Layer Presentasi:
    * Menangani tampilan dan antarmuka pengguna.
    * Bergantung pada Domain Layer tanpa mengetahui detail implementasi Data Layer.
    * Melibatkan state management, UI, dan navigasi di dalamnya.

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**
1. Membuat `left_drawer.dart` dan isi dengan kode di bawah
```
import 'package:flutter/material.dart';
import 'package:pixelplay_mobile/screens/menu.dart';
import 'package:pixelplay_mobile/screens/shoplist_form.dart';
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
              /*
              TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => ShopFormPage())
              );
            },
          ),
        ],
      ),
    );
  }
}
```
2. Menambahkan kode di bawah pada `menu.dart`
```
if (item.name == "Tambah Produk") {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => ShopFormPage(),
    ),
```
3. Membuat `shoplist_form.dart` dan tambahkan kode di bawah:
```
import 'package:flutter/material.dart';
import 'package:pixelplay_mobile/widgets/left_drawer.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Produk',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          // Menambahkan drawer yang sudah dibuat di sini
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Produk",
                        labelText: "Nama Produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          // Menambahkan variabel yang sesuai
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Jumlah",
                        labelText: "Jumlah",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan variabel yang sesuai
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          // Menambahkan variabel yang sesuai
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Jumlah tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          print("tes");
                          return "Jumlah harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Deskripsi",
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          // Menambahkan variabel yang sesuai
                          _description = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          // Menambahkan variabel yang sesuai
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Produk berhasil tersimpan'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Memunculkan value-value lainnya
                                        Text('Nama: $_name'),
                                        Text('Harga: $_amount'),
                                        Text('Deskripsi: $_description')
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          _formKey.currentState!.reset();
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        );
    }
}
```
4. Lakukan routing pada setiap file yang baru dibuat
5. Buat `shop_card.dart` dan pindahkan kode dari `menu.dart` ke `shoplist_form.dart`  
```
import 'package:flutter/material.dart';
import 'package:pixelplay_mobile/screens/shoplist_form.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

final List<ShopItem> items = [
  ShopItem("Lihat Produk", Icons.checklist),
  ShopItem("Tambah Produk", Icons.add_shopping_cart),
  ShopItem("Logout", Icons.logout),
];

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            
            if (item.name == "Tambah Produk") {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopFormPage(),
              ),
            );
            }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
6. Buat direktori `screens` dan pindahkan `menu.dart` dan `shoplist_form.dart` ke direktori `screens`