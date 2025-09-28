import 'package:flutter/material.dart';

final List<Map<String, dynamic>> contactsData = [
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

final List<Map<String, dynamic>> infoCategoriesData = [
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
];

final List<Map<String, dynamic>> solutionsData = [
  {
    'title': 'পাতা মোড়ানো রোগের সমাধান',
    'description': '''এই রোগটি ভাইরাস জনিত। প্রতিকার:
• আক্রান্ত গাছ তুলে ফেলুন
• জাব পোকা দমন করুন
• নিম তেল স্প্রে করুন
• প্রতিরোধী জাত ব্যবহার করুন''',
    'videoUrl': 'https://youtube.com/watch?v=example1',
  },
  {
    'title': 'ফল পচা রোগের চিকিৎসা',
    'description': '''ছত্রাক জনিত এই রোগের সমাধান:
• বোর্দো মিশ্রণ স্প্রে করুন
• পানি নিষ্কাশনের ব্যবস্থা করুন
• আক্রান্ত ফল সংগ্রহ করে পুড়িয়ে ফেলুন
• ট্রাইকোডার্মা ব্যবহার করুন''',
    'videoUrl': 'https://youtube.com/watch?v=example2',
  },
  {
    'title': 'পোকামাকড় দমন',
    'description': '''জৈবিক পদ্ধতিতে পোকা দমন:
• ফেরোমন ট্র্যাপ ব্যবহার করুন
• নিম তেল ও সাবান দিয়ে স্প্রে করুন
• উপকারী পোকা সংরক্ষণ করুন
• নিয়মিত পরিদর্শন করুন''',
    'videoUrl': 'https://youtube.com/watch?v=example3',
  }
];