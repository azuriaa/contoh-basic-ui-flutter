import 'dart:math';

import 'package:flutter/material.dart';

class HalamanLain extends StatefulWidget {
  const HalamanLain({super.key});

  @override
  State<HalamanLain> createState() => _HalamanLainState();
}

class _HalamanLainState extends State<HalamanLain> {
  String cpu = '';
  String ram = '';
  String store1 = '';
  String store2 = '';
  String gpu = '';
  String os = '';

  List<String> daftarOS = [
    'Windows 7',
    'Windows 8.1',
    'Windows 10',
    'Windows 11',
    'Windows KW',
    'Ubuntu',
    'Kubuntu',
    'Lubuntu',
    'Fedora',
    'MacOS KW',
  ];

  List<String> daftarGPU = [
    'Nvidia GT 1030',
    'Nvidia GTX 1650',
    'Nvidia RTX 2060',
    'Nvidia RTX 3050',
    'Nvidia RTX 3070',
    'Nvidia RTX 4060',
    'AMD RX 550',
    'AMD RX 580 2048SP (Merk China)',
    'AMD RX 580',
    'AMD RX 5700 XT',
    'AMD RX 6600',
    'AMD RX 7600',
    'Intel ARC 580',
  ];

  List<String> daftarCPU = [
    'Intel i3 12100F',
    'Intel i5 13600K',
    'Intel i7 14700K',
    'AMD Ryzen 7 7700X3D',
    'AMD Ryzen 5 7600',
  ];

  List<String> daftarRAM = [
    '2x8GB DDR5 4800MT/s',
    '2x8GB DDR5 6000MT/s',
    '2x16GB DDR5 6000MT/s',
    '2x16GB DDR5 7200MT/s',
    '2x32GB DDR5 7800MT/s',
  ];

  List<String> daftarStorage = [
    '512TB SSD NVME Gen 4',
    '512MB SSD NVME Gen 5',
    '1TB SSD SATA III',
    '2TB SSD NVME Gen 5',
    '500GB HDD SATA II',
  ];

  void halamanLainTutup() {
    Navigator.pop(context);
  }

  void osAcak() {
    Random rng = Random();
    int result = rng.nextInt(10);

    setState(() {
      os = daftarOS[result];
    });
  }

  void gpuAcak() {
    Random rng = Random();
    int result = rng.nextInt(13);

    setState(() {
      gpu = daftarGPU[result];
    });
  }

  void cpuRamAcak() {
    Random rng = Random();
    int result = rng.nextInt(5);
    int result2 = rng.nextInt(5);

    setState(() {
      cpu = daftarCPU[result];
      ram = daftarRAM[result2];
    });
  }

  void storageAcak() {
    Random rng = Random();
    int result = rng.nextInt(5);
    int result2 = rng.nextInt(5);

    setState(() {
      store1 = daftarStorage[result];
      store2 = daftarStorage[result2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Lain'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Halaman lain terbuka!, klik tombol di bawah untuk menutup.',
              ),
              ElevatedButton(
                onPressed: halamanLainTutup,
                child: const Text('Tutup'),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 8),
                child: const Text(
                  'Contoh Tampilan Kolom',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Nama',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('CPU'),
                      Text('RAM'),
                      Text('Storage 1'),
                      Text('Storage 2'),
                      Text('GPU'),
                      Text('OS'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Jenis',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(cpu),
                      Text(ram),
                      Text(store1),
                      Text(store2),
                      Text(gpu),
                      Text(os),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Acak Spesifikasi'),
                      ElevatedButton(
                        onPressed: cpuRamAcak,
                        child: const Text('Acak CPU & RAM'),
                      ),
                      ElevatedButton(
                        onPressed: storageAcak,
                        child: const Text('Acak Storage'),
                      ),
                      ElevatedButton(
                        onPressed: gpuAcak,
                        child: const Text('Acak GPU'),
                      ),
                      ElevatedButton(
                        onPressed: osAcak,
                        child: const Text('Acak OS'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
