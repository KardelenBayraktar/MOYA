import 'package:flutter/material.dart';
import 'package:moya/presentation/screens/recording/widgets/saved_placeholder.dart';

class RecordedScreen extends StatelessWidget {
  // Sidebar'ı açmak için gereken fonksiyonu ekledik
  final VoidCallback? onMenuTap; 

  const RecordedScreen({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          // Sol tarafa menü butonunu ekliyoruz
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onMenuTap,
          ),
          centerTitle: true,
          title: const Text(
            "Kaydedilenler",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: theme.primaryColor,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: "Bloglar"),
              Tab(text: "Egzersizler"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmptyStateView(
              message: "Kaydedilmiş Blog Yazısı Bulunmuyor",
              icon: Icons.article_outlined,
            ),
            EmptyStateView(
              message: "Kaydedilmiş Egzersiz Bulunmuyor",
              icon: Icons.fitness_center_outlined,
            ),
          ],
        ),
      ),
    );
  }
}