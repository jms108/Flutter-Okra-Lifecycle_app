/*import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static final UrlLauncherService _instance = UrlLauncherService._internal();
  factory UrlLauncherService() => _instance;
  UrlLauncherService._internal();

  // Launch URL in browser
  Future<bool> launchWebUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
      return false;
    } catch (e) {
      print('Error launching URL: $e');
      return false;
    }
  }

  // Make phone call
  Future<bool> makePhoneCall(String phoneNumber) async {
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(phoneUri)) {
        return await launchUrl(phoneUri);
      }
      return false;
    } catch (e) {
      print('Error making phone call: $e');
      return false;
    }
  }

  // Send SMS
  Future<bool> sendSms(String phoneNumber, {String? message}) async {
    try {
      String smsUrl = 'sms:$phoneNumber';
      if (message != null && message.isNotEmpty) {
        smsUrl += '?body=${Uri.encodeComponent(message)}';
      }
      
      final Uri smsUri = Uri.parse(smsUrl);
      if (await canLaunchUrl(smsUri)) {
        return await launchUrl(smsUri);
      }
      return false;
    } catch (e) {
      print('Error sending SMS: $e');
      return false;
    }
  }

  // Send email
  Future<bool> sendEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    try {
      String emailUrl = 'mailto:$email';
      List<String> params = [];
      
      if (subject != null && subject.isNotEmpty) {
        params.add('subject=${Uri.encodeComponent(subject)}');
      }
      
      if (body != null && body.isNotEmpty) {
        params.add('body=${Uri.encodeComponent(body)}');
      }
      
      if (params.isNotEmpty) {
        emailUrl += '?${params.join('&')}';
      }
      
      final Uri emailUri = Uri.parse(emailUrl);
      if (await canLaunchUrl(emailUri)) {
        return await launchUrl(emailUri);
      }
      return false;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  // Launch YouTube video
  Future<bool> launchYouTubeVideo(String videoUrl) async {
    try {
      final Uri uri = Uri.parse(videoUrl);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
      return false;
    } catch (e) {
      print('Error launching YouTube video: $e');
      return false;
    }
  }

  // Open Google Maps with location
  Future<bool> openMaps(String location) async {
    try {
      final Uri mapsUri = Uri.parse('https://www.google.com/maps/search/$location');
      if (await canLaunchUrl(mapsUri)) {
        return await launchUrl(
          mapsUri,
          mode: LaunchMode.externalApplication,
        );
      }
      return false;
    } catch (e) {
      print('Error opening maps: $e');
      return false;
    }
  }

  // Check if URL can be launched
  Future<bool> canLaunch(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      return await canLaunchUrl(uri);
    } catch (e) {
      print('Error checking URL: $e');
      return false;
    }
  }
}*/