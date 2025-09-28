import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';
import '../widgets/solution_card.dart';
import '../services/image_classifier_service.dart'; // Import the classification service

class ScanResultPage extends StatefulWidget {
  final String imagePath;

  const ScanResultPage({super.key, required this.imagePath});

  @override
  _ScanResultPageState createState() => _ScanResultPageState();
}

class _ScanResultPageState extends State<ScanResultPage> {
  final FlutterTts flutterTts = FlutterTts();
  bool _isPlaying = false;
  bool _isAnalyzing = true;
  ImageClassificationResult? _classificationResult;

  @override
  void initState() {
    super.initState();
    _initTts();
    _analyzeImage();
  }

  _initTts() async {
    await flutterTts.setLanguage("bn-BD");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  _analyzeImage() async {
    try {
      final result = await ImageClassifierService.classifyImage(widget.imagePath);
      setState(() {
        _classificationResult = result;
        _isAnalyzing = false;
      });
    } catch (e) {
      setState(() {
        _isAnalyzing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('বিশ্লেষণে সমস্যা হয়েছে। আবার চেষ্টা করুন।'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  _speak(String text) async {
    if (_isPlaying) {
      await flutterTts.stop();
      setState(() {
        _isPlaying = false;
      });
    } else {
      setState(() {
        _isPlaying = true;
      });
      await flutterTts.speak(text);
      
      flutterTts.setCompletionHandler(() {
        setState(() {
          _isPlaying = false;
        });
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Widget _buildAnalysisStatus() {
    if (_isAnalyzing) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'ছবি বিশ্লেষণ করা হচ্ছে...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_classificationResult == null) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.red, width: 2),
        ),
        child: const Row(
          children: [
            Icon(Icons.error, color: Colors.red, size: 30),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'বিশ্লেষণে সমস্যা হয়েছে',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (!_classificationResult!.isOkra) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.orange, width: 2),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.warning, color: Colors.orange, size: 30),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'এটি ঢেঁড়স গাছের ছবি নয়',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'এই অ্যাপটি শুধুমাত্র ঢেঁড়স গাছের রোগ নির্ণয়ের জন্য তৈরি। অনুগ্রহ করে ঢেঁড়স গাছের পাতা বা ফলের ছবি তুলুন।',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'বিশ্বস্ততা: ${(_classificationResult!.confidence * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    // Okra detected
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF4CAF50).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF4CAF50), width: 2),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 30),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  'ঢেঁড়স গাছ শনাক্ত হয়েছে!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'রোগ: ${_getDiseaseNameInBengali(_classificationResult!.disease)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'বিশ্বস্ততা: ${(_classificationResult!.confidence * 100).toStringAsFixed(1)}%',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String _getDiseaseNameInBengali(String disease) {
    switch (disease) {
      case 'leaf_curl':
        return 'পাতা মোড়ানো রোগ';
      case 'fruit_rot':
        return 'ফল পচা রোগ';
      case 'pest_attack':
        return 'পোকামাকড় আক্রমণ';
      case 'healthy':
        return 'সুস্থ উদ্ভিদ';
      default:
        return 'অজানা';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'স্ক্যান ফলাফল',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Display
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Analysis Status
            _buildAnalysisStatus(),

            const SizedBox(height: 20),

            // Solutions List (only show if okra is detected)
            if (_classificationResult != null && 
                _classificationResult!.isOkra &&
                _classificationResult!.solutions.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _classificationResult!.solutions.length,
                itemBuilder: (context, index) {
                  return SolutionCard(
                    solution: _classificationResult!.solutions[index],
                    onPlayAudio: _speak,
                    isPlaying: _isPlaying,
                  );
                },
              ),

            // Retry button for non-okra images
            if (_classificationResult != null && !_classificationResult!.isOkra)
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Go back to scanner
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('আবার ছবি তুলুন'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}