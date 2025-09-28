import 'package:flutter/material.dart';

// Solutions data for scan results
final List<Map<String, dynamic>> solutionsData = [
  {
    'title': 'পাতা মোড়ানো রোগের সমাধান',
    'description': '''এই রোগটি ভাইরাস জনিত। প্রতিকার:
• আক্রান্ত গাছ তুলে ফেলুন
• জাব পোকা দমন করুন (ইমিডাক্লোপ্রিড)
• নিম তেল স্প্রে করুন (২ মিলি/লিটার) 
• প্রতিরোধী জাত ব্যবহার করুন
• নিয়মিত পরিষ্কার-পরিচ্ছন্নতা বজায় রাখুন''',
    'videoUrl': 'https://youtu.be/KoKvqu8fry0?si=4M_0uKUT3GOBEHx4',
  },
  {
    'title': 'ফল পচা রোগের চিকিৎসা',
    'description': '''ছত্রাক জনিত এই রোগের সমাধান:
• বোর্দো মিশ্রণ স্প্রে করুন (১%)
• পানি নিষ্কাশনের ব্যবস্থা করুন
• আক্রান্ত ফল সংগ্রহ করে পুড়িয়ে ফেলুন
• ট্রাইকোডার্মা ব্যবহার করুন
• কার্বেন্ডাজিম প্রয়োগ করুন (১ গ্রাম/লিটার)''',
    'videoUrl': 'https://youtu.be/FoqvGx6sNAM?si=ouEfoQPybrqoSGhV',
  },
  {
    'title': 'পোকামাকড় দমন',
    'description': '''জৈবিক পদ্ধতিতে পোকা দমন:
• ফেরোমন ট্র্যাপ ব্যবহার করুন
• নিম তেল ও সাবান দিয়ে স্প্রে করুন
• উপকারী পোকা সংরক্ষণ করুন
• নিয়মিত পরিদর্শন করুন
• জৈব কীটনাশক ব্যবহার করুন''',
    'videoUrl': 'https://youtu.be/FoqvGx6sNAM?si=ouEfoQPybrqoSGhV',
  },
  {
    'title': 'পুষ্টির অভাব',
    'description': '''পাতার রং দেখে পুষ্টি নির্ণয়:
• হলুদ পাতা: নাইট্রোজেনের অভাব (ইউরিয়া প্রয়োগ)
• বেগুনি রং: ফসফরাসের অভাব (টিএসপি প্রয়োগ)
• পাতার কিনারা পোড়া: পটাসিয়ামের অভাব (এমওপি প্রয়োগ)
• ফলিয়ার স্প্রে করুন (NPK 19:19:19)''',
    'videoUrl': 'https://youtu.be/rDSeAD3zldk?si=kv6H1toJnC27H2lL',
  },
];

// Quick tips data
final List<Map<String, dynamic>> quickTipsData = [
  {
    'title': 'সেচের সঠিক সময়',
    'description': 'সকাল ও বিকালে সেচ দিন, দুপুরে নয়',
    'icon': Icons.schedule,
  },
  {
    'title': 'আগাছা দমন',
    'description': '১৫ দিন অন্তর আগাছা পরিষ্কার করুন',
    'icon': Icons.cleaning_services,
  },
  {
    'title': 'ফল সংগ্রহ',
    'description': 'কচি অবস্থায় ২-৩ দিন অন্তর সংগ্রহ করুন',
    'icon': Icons.shopping_basket,
  },
  {
    'title': 'রোগ প্রতিরোধ',
    'description': 'পরিষ্কার-পরিচ্ছন্নতা ও নিয়মিত পর্যবেক্ষণ',
    'icon': Icons.security,
  },
];
