import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SolutionCard extends StatelessWidget {
  final Map<String, dynamic> solution;
  final Function(String) onPlayAudio;
  final bool isPlaying;

  const SolutionCard({
    super.key,
    required this.solution,
    required this.onPlayAudio,
    required this.isPlaying,
  });

  Future<void> _launchYouTubeVideo(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode:
              LaunchMode.externalApplication, // Opens in YouTube app or browser
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error launching YouTube video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and audio button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    solution['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => onPlayAudio(solution['description']),
                    icon: Icon(
                      isPlaying ? Icons.stop : Icons.volume_up,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              solution['description'],
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),

          // YouTube Video Button
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final videoUrl = solution['videoUrl'];
                  if (videoUrl != null && videoUrl.isNotEmpty) {
                    await _launchYouTubeVideo(videoUrl);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('ভিডিও লিংক পাওয়া যায়নি'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('ভিডিও সমাধান দেখুন'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
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
    );
  }
}
