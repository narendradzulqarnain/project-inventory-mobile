# project_inventory

A new Flutter project.

**TUGAS 7**

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
*Stateless widget* tidak dapat diubah datanya ketika sudah dibentuk. Tampilan dan informasinya tidak akan berubah terhadap kejadian di aplikasi. Sebaliknya, *stateful widget* dapat merubah datanya setelah dibentuk. Informasi yang dimiliki dan tampilannya dapat berubah/menyesuaikan kejadian-kejadian pada aplikasi.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* *Stateless widget* MyHomePage
merupakan *widget* bersifat *stateless* untuk menampilkan halaman menu.
* *Stateless widget* ShopCard
merupakan *widget* bersifat *stateless* untuk menampilkan *cards* sebagai tombol. *Widget* ini menampilkan informasi dari objek ShopItem. Ketika tombol ditekan, akan muncul *snackbar* dengan teks "Kamu telah menekan tombol &lt;atribut nama dari objek ShopItem&gt;"

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
    **Penjelasan**<br>
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

**TUGAS 8**

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
push() akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan pushReplacement() menggantikan route yang sudah ada pada atas stack dengan route baru tersebut. Contoh penggunaan push() adalah tombol tambah item sedangkan contoh penggunaan pushReplacement() adalah tombol navigasi ke form tambah item pada *left drawer*

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
* *Single-child layout widgets* - Layout yang hanya memiliki satu child. Digunakan ketika ingin membuat kontainer dengan satu child

* *Multi-child layout widgets* - Layout yang dapat memiliki lebih dari satu children. Digunakan ketika ingin membuat kontainer dengan lebih dari satu child.

* *Sliver widgets* - Widget untuk membuat layout yang *scrollable* dengan komponen berbasis *sliver*.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

* Form() - Sebagai wadah untuk *input field*
* SingleChildScrollView() - Untuk membuat child widget di dalamnya menjadi *scrollable*
* TextFormField() - *Input field*

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Kode dipisah dan diorganisir sesuai dengan kegunaannya. Dalam flutter, penerapan *clean architecture* mengandung lapisan-lapisan seperti berikut.
* Presentation Layer (UI) - Mengandung UI seperti komponen, widget, screens, dan views.
* Domain Layer (Business Logic) - Mengandung logika bisnis dari aplikasi
* Data Layer - Tempat mengambil dan menyimpan data

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
* Buat file bernama left_drawer.dart dalam direktori widgets dan tambahkan kode berikut di dalamnya
``` dart
import 'package:flutter/material.dart';
import 'package:project_inventory/screens/menu.dart';
// TODO: Impor halaman ShopFormPage jika sudah dibuat
import 'package:project_inventory/screens/itemlist_form.dart';
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
                  'Project Inventory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Inventory favorit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                    
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```
* Tambahkan *List tile* pada children untuk navigasi dengan menambahkan kode berikut di dalam list children
``` dart
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
        MaterialPageRoute(
            builder: (context) => ShopFormPage(),
        ));
    },
),
```
* Buat berkas baru bernama itemlist_form.dart pada direktori lib dan tambahkan kode berikut di dalamnya.
``` dart
import 'package:flutter/material.dart';
import 'package:project_inventory/widgets/left_drawer.dart';
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
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
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
                        hintText: "Amount",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _amount = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Amount tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Amount harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
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
                                        Text('Name: $_name'),
                                        Text('Amount: $_amount'),
                                        Text('Description: $_description'),
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
* Pada widget ShopItem tambahkan kode berikut pada atribut onTap
```dart
// Navigate ke route yang sesuai (tergantung jenis tombol)
if (item.name == "Tambah Item") {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const ShopFormPage()));
}
```
* lakukan refactoring file seperti pada tutorial

**TUGAS 9 (DEPLOYMENT BELUM BERHASIL)**

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, tetapi membuat model terlebih dahulu akan memberikan manfaat lebih dibandingkan tidak membuat model. *class* model memberikan keamanan tipe sehingga jika error terkait tipe data dapat ditangkap oleh compiler. Model juga membuat kode lebih terorganisir.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Untuk membungkus InheritedWidget agar lebih mudah digunakan dan dapat digunakan kembali. CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter agar komponen lebih mudah digunakan dan dapat digunakan kembali

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Setelah mendapatkan data json, data dapat disimpan ke dalam variable menggunakan method jsonDecode. Setelah itu, data dapat diubah ke dalam bentuk model atau disimpan ke dalam variable. Untuk mengubah ke dalam bentuk model, kita dapat mengimplementasikan method fromJson. Selanjutnya, data sudah dapat diakses dalam bentuk objek dari model

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Dari form login flutter akan dikirimkan request beserta data username dan password pada form ke bagian autentikasi aplikasi django. Request akan diproses oleh aplikasi django, lalu dikembalikan ke flutter. Jika autentikasi berhasil, maka user akan masuk ke halaman utama.

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- StatefulWidget LoginPage untuk menampilkan halaman login.
- StatefulWidget ProductPage untuk menampilkan halaman list item

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- Membuat django app bernama authentication
- menambahkan app tersebut, corsheaders dan corsheaders.middleware.CorsMiddleware ke installed apps pada settings.py 
- pip install django-cors-headers
- tambahkan variable berikut di settings.py
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
- Buat fungsi login dan logout di authentication/views.py seperti di tutorial
- Buat file urls.py di app authentication dan tambahkan path fungsi login dan logout
- Tambahkan path untuk app authentication pada urls.py proyek
- Install package flutter provider dan pbp_django_auth
- Tambahkan cookierequest pada main.dart seperti di tutorial
- Buat file login.dart di dalam screens dan isi file tersebut seperti di tutorial
- Sesuaikan request urlnya
- Buat folder baru di dalam lib bernama models, lalu buat file item.dart di dalamnya
- Isi file tersebut dengan kode model yang di dapat dari QuickType seperti pada tutorial
- flutter pub add http
- Tambahkan potongan kode berikut pada android/app/src/main/AndroidManifest.xml
```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```
- Buat file list_item.dart di dalam screens, lalu isi file tersebut seperti di tutorial (sesuaikan url dan importnya)
- Tambahkan kondisi untuk tombol lihat item dan logout pada shop_card.dart agar pindah halaman ketika di tekan seperti pada tutorial.
- Buat fungsi untuk menambahkan item flutter di main/views.py dan tambahkan pathnya di urls.py seperti pada tutorial
- Tambahkan CookieRequest pada itemlist_form.dart dan ubah fungsi onPressed seperti pada tutorial.
