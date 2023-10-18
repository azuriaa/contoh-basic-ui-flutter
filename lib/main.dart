import 'dart:io';

import 'package:flutter/material.dart';

import 'halaman_lain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APK Perusak CPU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool progressMunculkan = false;

  void halamanLainBuka() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HalamanLain()),
    );
  }

  void snackBarMunculkan() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Muncul Snack Bar nya!'),
      ),
    );
  }

  Future<void> dialogBoxBuka(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Judul Dialog Box'),
          content: const Text(
            'ini adalah isi dari dialog, bisa diisi teks, button, gambar, dan lain lain.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Never aplikasiKill() {
    return exit(0);
  }

  void indikatorProgresUbah() {
    if (progressMunculkan == true) {
      setState(() {
        progressMunculkan = false;
      });
    } else {
      setState(() {
        progressMunculkan = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Judul APK'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Basic UI di Flutter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: halamanLainBuka,
              child: const Text('Buka halaman lain'),
            ),
            const Text('Tombol di atas akan membuka halaman ke lain'),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: snackBarMunculkan,
                child: const Text('Munculkan Snack Bar'),
              ),
            ),
            const Text(
              'Tombol di atas akan memunculkan notifikasi berupa snack bar.',
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                  onPressed: () => dialogBoxBuka(context),
                  child: const Text('Buka dialog box')),
            ),
            const Text('Tombol di atas akan membuka dialog box'),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: aplikasiKill,
                child: const Text('Kill Aplikasi Ini'),
              ),
            ),
            const Text('Tombol di atas akan memaksa menutup aplikasi ini'),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: indikatorProgresUbah,
                child: const Text('Tampilkan/Sembunyikan Progress Indicator'),
              ),
            ),
            if (progressMunculkan == true) const CircularProgressIndicator(),
            const Text(
              'Tombol di atas akan menampilkan/menyembunyikan progress indikator',
            ),
            const Divider(),
            const Center(
              child: Text(
                'Thank You :)',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
