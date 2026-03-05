import 'package:flutter/material.dart';
import '../widgets/video_player_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 🔥 Lista de videos
  final List<Map<String, dynamic>> videos = [
    {
      "url": "https://www.w3schools.com/html/mov_bbb.mp4",
      "username": "usuario1",
      "description": "¡Mi primer video! 🎉",
    },
    {
      "url": "https://www.w3schools.com/html/movie.mp4",
      "username": "usuario2",
      "description": "Video increíble 🔥 #flutter #tiktok",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "username": "usuario3",
      "description": "Big Buck Bunny 🐰 #animacion",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      "username": "usuario4",
      "description": "Elephants Dream 🐘 #corto",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      "username": "usuario5",
      "description": "For Bigger Blazes 🔥 #accion",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
      "username": "usuario6",
      "description": "Subaru en acción 🚗 #autos",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      "username": "usuario7",
      "description": "Aventura extrema 🏔️ #naturaleza",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "username": "usuario8",
      "description": "Diversión garantizada 😂 #humor",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
      "username": "usuario9",
      "description": "Paseo increíble 🏎️ #velocidad",
    },
    {
      "url":
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
      "username": "usuario10",
      "description": "Momento épico 🎬 #viral",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];

          final String url = video["url"] ?? "";
          final String username = video["username"] ?? "";
          final String description = video["description"] ?? "";

          return Stack(
            fit: StackFit.expand,
            children: [

              // 🎬 Video
              VideoPlayerItem(videoUrl: url, username: '', description: '',),

              // 🔥 Info usuario
              _buildVideoInfo(username, description),

              // ❤️ Botones laterales
              const _SideButtons(),
            ],
          );
        },
      ),
    );
  }

  // 🔹 Información del video
  Widget _buildVideoInfo(String username, String description) {
    return Positioned(
      bottom: 80,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "@$username",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// 🔥 Widget separado para botones laterales (mejor rendimiento)
class _SideButtons extends StatelessWidget {
  const _SideButtons();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 16,
      child: Column(
        children: const [
          Icon(Icons.favorite, color: Colors.white, size: 32),
          SizedBox(height: 20),
          Icon(Icons.comment, color: Colors.white, size: 32),
          SizedBox(height: 20),
          Icon(Icons.share, color: Colors.white, size: 32),
        ],
      ),
    );
  }
}