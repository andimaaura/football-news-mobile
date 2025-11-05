import 'package:flutter/material.dart';
import 'package:football_news/widgets/left_drawer.dart';
import 'package:football_news/widgets/news_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String nama = "Lionel Messi";
  final String npm = "2406275678";
  final String kelas = "B";

  @override
  Widget build(BuildContext context) {
    final items = const [
      ItemHomepage("See Football News", Icons.article_outlined),
      ItemHomepage("Add News", Icons.add_circle_outline),
      ItemHomepage("Logout", Icons.exit_to_app),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football News',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info cards responsif
            LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                int cross = 3;
                if (w < 700) cross = 2;
                if (w < 420) cross = 1;
                return GridView.count(
                  crossAxisCount: cross,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: nama),
                    InfoCard(title: 'Class', content: kelas),
                  ],
                );
              },
            ),

            const SizedBox(height: 12),
            const Text(
              "Selamat datang di Football News",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),

            // Tombol responsif (grid)
            LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                int cross = 3;          // web lebar
                if (w < 900) cross = 2; // tablet/phone lebar
                if (w < 380) cross = 1; // phone kecil
                return GridView.count(
                  crossAxisCount: cross,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: items.map((e) => NewsCard(item: e)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 2),
            color: Color(0x1A000000),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
