/*import 'package:flutter_tts/flutter_tts.dart';
import '../utils/constants.dart';

class TextToSpeechService {
  static final TextToSpeechService _instance = TextToSpeechService._internal();
  factory TextToSpeechService() => _instance;
  TextToSpeechService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isPlaying = false;

  // Getters
  bool get isPlaying => _isPlaying;
  bool get isInitialized => _isInitialized;

  // Initialize TTS
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await _flutterTts.setLanguage(AppConstants.ttsLanguage);
      await _flutterTts.setSpeechRate(AppConstants.ttsSpeechRate);
      await _flutterTts.setVolume(AppConstants.ttsVolume);
      await _flutterTts.setPitch(AppConstants.ttsPitch);
      
      _flutterTts.setCompletionHandler(() {
        _isPlaying = false;
      });

      _flutterTts.setErrorHandler((message) {
        _isPlaying = false;
        print('TTS Error: $message');
      });

      _isInitialized = true;
    } catch (e) {
      print('TTS Initialization Error: $e');
    }
  }

  // Speak text
  Future<void> speak(String text) async {
    if (!_isInitialized) {
      await initialize();
    }

    if (_isPlaying) {
      await stop();
      return;
    }

    try {
      _isPlaying = true;
      await _flutterTts.speak(text);
    } catch (e) {
      _isPlaying = false;
      print('TTS Speak Error: $e');
    }
  }

  // Stop speaking
  Future<void> stop() async {
    try {
      await _flutterTts.stop();
      _isPlaying = false;
    } catch (e) {
      print('TTS Stop Error: $e');
    }
  }

  // Pause speaking
  Future<void> pause() async {
    try {
      await _flutterTts.pause();
    } catch (e) {
      print('TTS Pause Error: $e');
    }
  }

  // Check if language is available
  Future<bool> isLanguageAvailable(String language) async {
    try {
      List<dynamic> languages = await _flutterTts.getLanguages;
      return languages.contains(language);
    } catch (e) {
      print('TTS Language Check Error: $e');
      return false;
    }
  }

  // Get available languages
  Future<List<String>> getAvailableLanguages() async {
    try {
      List<dynamic> languages = await _flutterTts.getLanguages;
      return languages.cast<String>();
    } catch (e) {
      print('TTS Get Languages Error: $e');
      return [];
    }
  }

  // Set speech rate
  Future<void> setSpeechRate(double rate) async {
    try {
      await _flutterTts.setSpeechRate(rate);
    } catch (e) {
      print('TTS Set Speech Rate Error: $e');
    }
  }

  // Set volume
  Future<void> setVolume(double volume) async {
    try {
      await _flutterTts.setVolume(volume);
    } catch (e) {
      print('TTS Set Volume Error: $e');
    }
  }

  // Set pitch
  Future<void> setPitch(double pitch) async {
    try {
      await _flutterTts.setPitch(pitch);
    } catch (e) {
      print('TTS Set Pitch Error: $e');
    }
  }

  // Dispose
  void dispose() {
    _flutterTts.stop();
  }
}*/