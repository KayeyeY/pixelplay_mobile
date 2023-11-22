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


### Readme tugas 9
**Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
  - Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Ya bisa, kita dapat mengakalinya dengan menggunakan sebuah variabel yang menyimpan sebuah dictionary berisi data.

  - Apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON? Tidak, justru model mempermudah kita dalam melakukan pengambilan data karena dengan model kita dapat memastikan suatu objek memiliki semua nilai atribut pada kelas dibanding dengan dictionary yang bisa saja kita melewatkan suatu atribut.

**Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
CookieRequest adalah salah satu class pada package pbp_django_auth.dart.  
  
Fungsi dari class CookieRequest:
  * Menyediakan fungsi untuk inisialisasi sesi, login, dan logout yang memungkinkan aplikasi untuk melacak status login dan sesi pengguna.
  * Cookies berupa informasi sesi tersebut disimpan secara lokal.
  * Melakukan permintaan HTTP dengan metode GET dan POST.  
    
CookieRequest harus diperluas atau dibagikan ke seluruh komponen dalam aplikasi Flutter untuk memastikan konsistensi status login atau sesi (cookies). Dengan demikian, jika ada perubahan dalam status login atau sesi di suatu komponen atau aplikasi, perubahan tersebut juga akan tercermin di komponen atau aplikasi lainnya.

**Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

Buatlah model kustom menggunakan layanan Quicktype yang memproses data JSON yang diperoleh dari endpoint /json pada proyek Django. Tambahkan dependensi HTTP ke proyek Flutter, sertakan dependensi http, dan masukkan kode `<uses-permission android:name="android.permission.INTERNET" />` pada file AndroidManifest.xml yang terletak di android/app/src/main/ untuk mengizinkan akses internet.

Di salah satu file di direktori lib/screens yang akan melakukan pengambilan data, implementasikan fungsi asinkron dan kirimkan permintaan HTTP untuk mendapatkan 

**Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

Pengguna memasukkan data akun berupa username dan password di halaman LoginPage. Saat tombol login ditekan, fungsi login pada CookieRequest dipanggil, yang mengirimkan permintaan HTTP ke endpoint URL proyek Django. Pada sisi Django, autentikasi dilakukan melalui langkah-langkah seperti user = authenticate(username=username, password=password) dalam views.py yang berkaitan dengan otentikasi. Setelah itu, dilakukan pengecekan apakah user is not None dan user.is_active.

Kembali ke Flutter, jika request.loggedIn, pengguna diarahkan ke halaman MyHomePage, dan tampilan selamat datang muncul menggunakan SnackBar.

**Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

1. Membuat app authentication dan menginstall corsheaders
2. lalu buat metode view pada authentication untuk login dan logout
3. Membuat model dengan endpoint JSON pada web django sebelumnya.
4. Masukan data ke quicktype untuk membuat model.
5. `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.
6. Buat file list_product.dart dan isi dengan kode dibawah.
```
import 'package:<APP_NAME>/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://<URL_APP_KAMU>/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
```
7. Buat fungsi view baru pada main
```
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        
        data = json.loads(request.body)

        new_product = Product.objects.create(
            user = request.user,
            name = data["name"],
            price = int(data["price"]),
            description = data["description"]
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```
8. Hubungkan shoplist_form.dart dengan cookierequest:
```
@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
```