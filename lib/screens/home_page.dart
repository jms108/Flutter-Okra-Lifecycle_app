import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, Map<String, dynamic>> categories = {
    'আবহাওয়া': {
      'key': 'weather',
      'icon': Icons.wb_sunny,
      'color': const Color(0xFF4CAF50),
    },
    'মাটি নির্বাচন': {
      'key': 'soil',
      'icon': Icons.landscape,
      'color': const Color(0xFF8BC34A),
    },
    'বীজ নির্বাচন': {
      'key': 'seed',
      'icon': Icons.eco,
      'color': const Color(0xFF66BB6A),
    },
    'চাষাবাদ': {
      'key': 'cultivation',
      'icon': Icons.agriculture,
      'color': const Color(0xFF4CAF50),
    },
    'সার ও সেচ': {
      'key': 'fertilizer_irrigation',
      'icon': Icons.water_drop,
      'color': const Color(0xFF2196F3),
    },
    'রোগ ও প্রতিকার': {
      'key': 'disease',
      'icon': Icons.local_hospital,
      'color': const Color(0xFFFF5722),
    },
    'ফল সংগ্রহ ও সংরক্ষণ': {
      'key': 'harvest_marketing',
      'icon': Icons.shopping_basket,
      'color': const Color(0xFFFF9800),
    },
    'বাজারজাতকরণ': {
      'key': 'marketing',
      'icon': Icons.monetization_on,
      'color': const Color(0xFF9C27B0),
    },
  };

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 243, 230),
      body: SafeArea(
        child: Column(
          children: [
            // Header with gradient background and image overlay
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF4CAF50).withOpacity(0.3),
                    Colors.white
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      child: Image.asset(
                        'assets/images/okra3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 39, 99, 42).withOpacity(0.6),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'ঢেঁড়স চাষাবাদ',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ঢেঁড়স চাষের প্রতিটি ধাপ জানুন',
                          style: TextStyle(
                            color: Color.fromARGB(179, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Categories Grid
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String categoryTitle = categories.keys.elementAt(index);
                    Map<String, dynamic> categoryInfo =
                        categories[categoryTitle]!;
                    return CategoryCard(
                      title: categoryTitle,
                      icon: categoryInfo['icon'],
                      color: categoryInfo['color'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(category: categoryTitle),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
