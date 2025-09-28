import 'dart:io';
import 'dart:math';

class ImageClassificationResult {
  final bool isOkra;
  final String category;
  final String disease;
  final double confidence;
  final List<Map<String, dynamic>> solutions;

  ImageClassificationResult({
    required this.isOkra,
    required this.category,
    required this.disease,
    required this.confidence,
    required this.solutions,
  });
}

class ImageClassifierService {
  // Simulated ML model predictions - In real implementation, this would use TensorFlow Lite
  static Future<ImageClassificationResult> classifyImage(String imagePath) async {
    // Simulate processing delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Get basic image properties for simple classification
    final file = File(imagePath);
    final imageSize = await file.length();
    final fileName = file.path.toLowerCase();
    
    // Simple heuristic classification (replace with actual ML model)
    final classification = _simulateClassification(fileName, imageSize);
    
    return classification;
  }

  static ImageClassificationResult _simulateClassification(String fileName, int imageSize) {
    final random = Random();
    
    // Simulate different scenarios based on filename or other heuristics
    // In real implementation, this would be replaced by actual ML model inference
    
    // Check if filename suggests okra-related content
    if (fileName.contains('okra') || fileName.contains('lady') || 
        fileName.contains('finger') || fileName.contains('vegetable')) {
      return _getOkraClassification(random);
    }
    
    // Random simulation for demo purposes
    final isOkraImage = random.nextDouble() > 0.3; // 70% chance it's okra for demo
    
    if (isOkraImage) {
      return _getOkraClassification(random);
    } else {
      return _getNonOkraClassification(random);
    }
  }

  static ImageClassificationResult _getOkraClassification(Random random) {
    final diseases = [
      {
        'disease': 'leaf_curl',
        'name': 'পাতা মোড়ানো রোগ',
        'solutions': [ScanSolutions.solutions[0]]
      },
      {
        'disease': 'fruit_rot',
        'name': 'ফল পচা রোগ',
        'solutions': [ScanSolutions.solutions[1]]
      },
      {
        'disease': 'pest_attack',
        'name': 'পোকামাকড় আক্রমণ',
        'solutions': [ScanSolutions.solutions[2]]
      },
      {
        'disease': 'healthy',
        'name': 'সুস্থ উদ্ভিদ',
        'solutions': [_getHealthyPlantSolution()]
      }
    ];
    
    final selectedDisease = diseases[random.nextInt(diseases.length)];
    final confidence = 0.75 + random.nextDouble() * 0.2; // 75-95% confidence
    
    return ImageClassificationResult(
      isOkra: true,
      category: 'okra_plant',
      disease: selectedDisease['disease'] as String,
      confidence: confidence,
      solutions: selectedDisease['solutions'] as List<Map<String, dynamic>>,
    );
  }

  static ImageClassificationResult _getNonOkraClassification(Random random) {
    final nonOkraCategories = [
      'human_face',
      'animal',
      'other_plant',
      'object',
      'building',
      'food_item'
    ];
    
    final category = nonOkraCategories[random.nextInt(nonOkraCategories.length)];
    final confidence = 0.8 + random.nextDouble() * 0.15; // 80-95% confidence
    
    return ImageClassificationResult(
      isOkra: false,
      category: category,
      disease: 'not_applicable',
      confidence: confidence,
      solutions: [],
    );
  }

  static Map<String, dynamic> _getHealthyPlantSolution() {
    return {
      'title': 'সুস্থ ঢেঁড়স গাছ',
      'description': '''আপনার ঢেঁড়স গাছ সুস্থ দেখাচ্ছে! রক্ষণাবেক্ষণের জন্য:
• নিয়মিত পানি দিন (সকাল-বিকাল)
• ১৫ দিন অন্তর আগাছা পরিষ্কার করুন
• মাসিক কম্পোস্ট সার প্রয়োগ করুন
• নিয়মিত গাছ পরিদর্শন করুন
• পোকামাকড়ের জন্য নজর রাখুন''',
      'videoUrl': 'https://youtu.be/example_healthy_plant',
    };
  }
}

// Import your existing ScanSolutions class
class ScanSolutions {
  static const List<Map<String, dynamic>> solutions = [
    {
      'title': 'পাতা মোড়ানো রোগের সমাধান',
      'description': '''এই রোগটি ভাইরাস জনিত। প্রতিকার:
• আক্রান্ত গাছ তুলে ফেলুন
• জাব পোকা দমন করুন
• নিম তেল স্প্রে করুন
• প্রতিরোধী জাত ব্যবহার করুন''',
      'videoUrl': 'https://youtu.be/KoKvqu8fry0?si=4M_0uKUT3GOBEHx4',
    },
    {
      'title': 'ফল পচা রোগের চিকিৎসা',
      'description': '''ছত্রাক জনিত এই রোগের সমাধান:
• বোর্দো মিশ্রণ স্প্রে করুন
• পানি নিষ্কাশনের ব্যবস্থা করুন
• আক্রান্ত ফল সংগ্রহ করে পুড়িয়ে ফেলুন
• ট্রাইকোডার্মা ব্যবহার করুন''',
      'videoUrl': 'https://youtu.be/FoqvGx6sNAM?si=ouEfoQPybrqoSGhV',
    },
    {
      'title': 'পোকামাকড় দমন',
      'description': '''জৈবিক পদ্ধতিতে পোকা দমন:
• ফেরোমন ট্র্যাপ ব্যবহার করুন
• নিম তেল ও সাবান দিয়ে স্প্রে করুন
• উপকারী পোকা সংরক্ষণ করুন
• নিয়মিত পরিদর্শন করুন''',
      'videoUrl': 'https://youtu.be/rDSeAD3zldk?si=kv6H1toJnC27H2lL',
    }
  ];
}