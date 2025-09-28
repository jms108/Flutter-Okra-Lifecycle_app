import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../utils/detail_data.dart';

class DetailPage extends StatefulWidget {
  final String category;

  const DetailPage({super.key, required this.category});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final FlutterTts flutterTts = FlutterTts();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  _initTts() async {
    await flutterTts.setLanguage("bn-BD");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
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

  @override
  Widget build(BuildContext context) {
    String content = DetailData.getData(widget.category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4CAF50), Colors.white],
            stops: [0.0, 0.3],
          ),
        ),
        child: Column(
          children: [
            // Sound Control Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => _speak(content),
                      icon: Icon(
                        _isPlaying ? Icons.stop : Icons.volume_up,
                        color: const Color(0xFF4CAF50),
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    _isPlaying ? 'বন্ধ করুন' : 'শুনুন',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            // Content Section
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
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