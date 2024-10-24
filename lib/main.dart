import 'package:flutter/material.dart';

// Uygulamanın başlangıç noktası
void main() {
  runApp(MyApp());
}

// Ana uygulama widget'ı
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı gizle
      home: HomePage(), // Ana sayfa widget'ı
    );
  }
}

// Ana sayfa widget'ı
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              'Firmalar', // Uygulama çubuğundaki başlık
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Geri düğmesi simgesi
          onPressed: () {
            // Geri tuşu işlemi (işlevsellik eklenebilir)
          },
        ),
        backgroundColor: Color(0xFF4A148C), // Uygulama çubuğu arka plan rengi
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // İçerik için kenar boşlukları
        child: Column(
          children: [
            // Sağlık bölümü butonu
            Container(
              padding: EdgeInsets.all(12), // İç boşluk
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4A148C), Color(0xFF7B1FA2)], // Renk geçişi
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(8), // Kenar yuvarlama
              ),
              child: Row(
                children: [
                  // Ev ikonu ve kırmızı artı
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add, // Kırmızı artı simgesi
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // İki widget arasındaki boşluk
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0), // Metin için sol boşluk
                        child: Text(
                          'Sağlık', // Buton metni
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Sağlık butonuyla sonraki bölüm arasındaki boşluk

            // Firma Ara kısmı
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), // Arama ikonu
                    hintText: 'Firma Ara', // Arama kutusundaki ipucu metni
                    filled: true, // Arka plan rengini doldur
                    fillColor: Colors.grey.shade300, // Arka plan rengi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Kenar yuvarlama
                    ),
                  ),
                ),
                SizedBox(height: 8), // Arama kutusuyla açıklama metni arasındaki boşluk
                Text(
                  'İstediğiniz firmada indirim yakalama fırsatı...',
                  style: TextStyle(color: Colors.grey.shade600), // Açıklama metni rengi
                ),
              ],
            ),
            SizedBox(height: 16), // Firma arama kısmıyla firma listesinin arasındaki boşluk

            // Firma listesi
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Liste öğe sayısı
                itemBuilder: (context, index) {
                  return CompanyCard(
                    companyName: index % 2 == 0 // Tekrar eden firma adları
                        ? "Firma Adı Uzun Firma Adı"
                        : "Firma Adı",
                    discount: "10%", // İndirim oranı
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Firma kartları için widget
class CompanyCard extends StatelessWidget {
  final String companyName; // Firma adı
  final String discount; // İndirim oranı

  CompanyCard({required this.companyName, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Kart kenar yuvarlama
      margin: EdgeInsets.symmetric(vertical: 8), // Kartlar arası dikey boşluk
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.local_offer, color: Color(0xFF4A148C)), // İndirim simgesi
          ),
          Expanded(
            child: Text(companyName), // Firma adı
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 80,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient( // Arka planda geçiş
                  colors: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), // Kartın sağ üst köşesi yuvarlatma
                  bottomRight: Radius.circular(10), // Kartın sağ alt köşesi yuvarlatma
                ),
              ),
              child: Text(
                discount, // İndirim oranı
                style: TextStyle(color: Colors.white, fontSize: 16), // İndirim yazısı stili
              ),
            ),
          ),
        ],
      ),
    );
  }
}
