import 'package:flutter/material.dart';
import '../widgets/info_card.dart';
import 'info_deatil_page.dart';
//import 'info_detail_page.dart';

class InfoPage extends StatelessWidget {
  final List<Map<String, dynamic>> infoCategories = [
    {
      'title': 'চাষাবাদ গাইড',
      'icon': Icons.agriculture,
      'description': 'সম্পূর্ণ চাষাবাদ প্রক্রিয়া',
    },
    {
      'title': 'রোগ নির্ণয়',
      'icon': Icons.local_hospital,
      'description': 'রোগ চিহ্নিতকরণ ও চিকিৎসা',
    },
    {
      'title': 'বাজার মূল্য',
      'icon': Icons.monetization_on,
      'description': 'বর্তমান বাজার দর',
    },
    {
      'title': 'আবহাওয়া তথ্য',
      'icon': Icons.wb_sunny,
      'description': 'কৃষি আবহাওয়া পূর্বাভাস',
    },
    {
      'title': 'পুষ্টিগুণ',
      'icon': Icons.wb_sunny,
      'description': 'পুষ্টিগুণ ও উপকারিতা',
    },
  ];

  InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'তথ্য কেন্দ্র',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF4CAF50).withOpacity(0.1), Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: infoCategories.length,
          itemBuilder: (context, index) {
            return InfoCard(
              category: infoCategories[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoDetailPage(
                      category: infoCategories[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
