# project_inventory

A new Flutter project.

**TUGAS 7**

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
*Stateless widget* tidak dapat diubah datanya ketika sudah dibentuk. Tampilan dan informasinya tidak akan berubah terhadap kejadian di aplikasi. Sebaliknya, *stateful widget* dapat merubah datanya setelah dibentuk. Informasi yang dimiliki dan tampilannya dapat berubah/menyesuaikan kejadian-kejadian pada aplikasi.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* *Stateless widget* MyHomePage
*Widget* bersifat *stateless* untuk menampilkan halaman menu.
* *Stateless widget* ShopCard
*Widget* bersifat *stateless* untuk menampilkan *cards* sebagai tombol. *Widget* ini menampilkan informasi dari objek ShopItem. Ketika tombol ditekan, akan muncul *snackbar* dengan teks "Kamu telah menekan tombol &lt;atribut nama dari objek ShopItem&gt;

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
    1. Buat proyek flutter baru dan masuk ke dalam direktorinya dengan menjalankan perintah berikut.
    ```flutter create project_inventory```
    ```cd project_inventory```
    2. Buat file baru bernama menu.dart pada direktori project_inventory/lib dan isi file tersebut dengan kode berikut.
    ```dart
    import 'package:flutter/material.dart';
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);
        final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.indigo),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blueGrey),
        ShopItem("Logout", Icons.logout, Colors.grey),
    ];
        @override
        Widget build(BuildContext context) {
            return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Project Inventory',
            ),
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'Inventory', // Text yang menandakan toko
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
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
    final MaterialColor color;

    ShopItem(this.name, this.icon, this.color);
    }

    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
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
    **Penjelasan**
    Potongan kode diatas awalnya hanya berbeda di beberapa atribut string yang ditampilkan pada halaman menu, contohnya *title*. Setelah itu, untuk mengimplementasikan warna berbeda pada tiap tombol, *class ShopItem* ditambahkan atribut ```final MaterialColor color;``` dan parameter pada *constructor* untuk mengisi atribut tersebut. Pada pemanggilan *constructor* di *class MyHomePage*, tambahkan parameter untuk atribut warna. Setelah itu, ubah potongan kode berikut pada fungsi build di *class ShopCard*.
    ```dart
     @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      ...
    )
  }
    ```
    menjadi 
    ```dart
     @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      ...
    )
  }
    ```

    3. Pada file main.dart, hapus seluruh kode dari baris ke-39 hingga akhir.
    4. Ubah baris ke-31 menjadi ```colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),``` dan baris ke-34 menjadi ```home: MyHomePage()```.
    5. Jalankan perintah ```flutter run``` untuk menjalankan aplikasi.
    6. Buat repositori baru di github, lalu hubungkan dengan direktori projek di lokal dengan menjalankan perintah berikut
    ```
    git init
    git branch -M main
    git remote add origin <link repo>
    ```
    7. Lakukan *add, commit, push* ke repositori github
    ```
    git add .
    git commit -m "selesai tugas 7"
    git push -u origin main
    ```