import 'package:flutter/material.dart';
import '../widgets/contact_card.dart';

class ContactPage extends StatelessWidget {
  final List<Map<String, dynamic>> contacts = [
    {
      'name': 'কৃষি তথ্য সেবা',
      'phone': '16123',
      'description': '২৪ ঘন্টা কৃষি তথ্য সেবা',
      'icon': Icons.info,
    },
    {
      'name': 'জরুরি কৃষি সহায়তা',
      'phone': '999',
      'description': 'জরুরি কৃষি সমস্যার সমাধান',
      'icon': Icons.emergency,
    },
    {
      'name': 'উপজেলা কৃষি অফিস',
      'phone': '01700000000',
      'description': 'স্থানীয় কৃষি কর্মকর্তা',
      'icon': Icons.location_on,
    },
    {
      'name': 'কৃষি গবেষণা ইনস্টিটিউট',
      'phone': '02-9252369',
      'description': 'কৃষি গবেষণা ও পরামর্শ',
      'icon': Icons.science,
    },
  ];

  ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'যোগাযোগ',
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
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactCard(contact: contacts[index]);
          },
        ),
      ),
    );
  }
}
