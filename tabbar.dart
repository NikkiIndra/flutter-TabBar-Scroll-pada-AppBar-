import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// tambahkan  with TickerProviderStateMixin agar kelas ini dapat memberikan vsync untuk animasi.
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  // untuk mengetahui setiap tab yang di klik
  late TabController _tabController;

  // Membuat objek TabController dan menginisialisasinya dengan panjang tab sebanyak 3 dan 
  // menggunakan 'vsync'(vertical synchronization) yang berasal dari objek State yang menjalankan kode ini.
  // untuk mengontrol frekuensi frame animasi agar animasi berjalan dengan mulus dan efisien dengan refresh rate layar.
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // membebaskan resource yang tidak lagi diperlukan seperti controller atau listener.
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "TabBar Scroll",
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar.secondary(
          // nonaktifkan isScrollable ini agar icon tidak berdekatan
          isScrollable: true, 
          controller: _tabController,
          onTap: (value) => setState(
            () {
              _tabController.index = value;
            },
          ),
          tabs: [
            Tab(
              // ketika di klik akan memberikan efek perubahan pada icon
              // contohnya perubahan di warna icon ketika di klik
              icon: Icon(
                // jika tabnya sesuai dengan index yaitu 0 maka akan menjalankan icon "favorite_rounded" dan sebaliknya
                _tabController.index == 0
                    ? Icons.favorite_rounded
                    : Icons.favorite_border,
                size: 20,
                color: _tabController.index == 0 ? Colors.green : Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                _tabController.index == 1
                    ? Icons.add_a_photo
                    : Icons.add_a_photo_outlined,
                color: _tabController.index == 1 ? Colors.deepPurple : Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                _tabController.index == 2 ? Icons.phone : Icons.phone_outlined,
                color: _tabController.index == 2 ? Colors.green.shade900 : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
