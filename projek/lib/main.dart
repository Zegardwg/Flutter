import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SmartPhone Hub",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SmartphoneCatalog(nim: 13)),
            );
          },
          child:
              Text("View Smartphone Catalog", style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class SmartphoneCatalog extends StatelessWidget {
  final int nim;

  SmartphoneCatalog({required this.nim});

  final List<Map<String, dynamic>> smartphones = [
    {
      "name": "iPhone 13 Pro",
      "price": "Rp 1",
      "image":
          "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-13-pro-max-2.jpg",
      "specs": "A15 Bionic, 6GB RAM, 128GB Storage"
    },
    {
      "name": "Samsung Galaxy S21",
      "price": "Rp 2",
      "image":
          "https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-s21-5g-0.jpg",
      "specs": "Exynos 2100, 8GB RAM, 128GB Storage"
    },
    {
      "name": "Google Pixel 6",
      "price": "Rp 10",
      "image": "https://fdn2.gsmarena.com/vv/pics/google/google-pixel-6-1.jpg",
      "specs": "Google Tensor, 8GB RAM, 128GB Storage"
    },
    {
      "name": "OnePlus 9 Pro",
      "price": "969",
      "image": "https://fdn2.gsmarena.com/vv/pics/oneplus/oneplus-9-pro-1.jpg",
      "specs": "Snapdragon 888, 12GB RAM, 256GB Storage"
    },
    {
      "name": "Xiaomi Mi 11",
      "price": "749",
      "image": "https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-mi11-1.jpg",
      "specs": "Snapdragon 888, 8GB RAM, 256GB Storage"
    },
  ];

  @override
  Widget build(BuildContext context) {
    int lastDigit = nim % 10;
    int x = lastDigit > 5 ? lastDigit - 4 : lastDigit;

    return Scaffold(
      appBar: AppBar(
        title: Text("Smartphone Catalog",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: smartphones.length + (smartphones.length ~/ x),
        itemBuilder: (context, index) {
          if ((index + 1) % (x + 1) == 0) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Special Offer: Get 10% off on your next purchase!",
                  style: TextStyle(
                      color: Colors.blue[800], fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            int phoneIndex = index - (index ~/ (x + 1));
            return SmartphoneCard(smartphone: smartphones[phoneIndex]);
          }
        },
      ),
    );
  }
}

class SmartphoneCard extends StatelessWidget {
  final Map<String, dynamic> smartphone;

  SmartphoneCard({required this.smartphone});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                smartphone['image'],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    smartphone['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$${smartphone['price']}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    smartphone['specs'],
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Icon(Icons.star,
                            color: index < 4 ? Colors.amber : Colors.grey[300],
                            size: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
