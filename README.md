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