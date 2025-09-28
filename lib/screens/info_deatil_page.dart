import 'package:flutter/material.dart';

class InfoDetailPage extends StatelessWidget {
  final Map<String, dynamic> category;

  const InfoDetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category['title'],
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFF4CAF50), width: 2),
              ),
              child: Column(
                children: [
                  Icon(
                    category['icon'],
                    size: 80,
                    color: const Color(0xFF4CAF50),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'শীঘ্রই আসছে...',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'এই বিভাগটি শীঘ্রই যোগ করা হবে',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      //textAlign: TextAlign.center,
                    ),
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
