import 'package:flutter/material.dart';
import '../widgets/video_player_item.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> videos = [
    {
      'url': 'https://www.w3schools.com/html/mov_bbb.mp4',
      'username': 'usuario1',
      'description': '¡Mi primer video! 🎉',
    },
    {
      'url': 'https://www.w3schools.com/html/movie.mp4',
      'username': 'usuario2',
      'description': 'Video increíble 🔥 #flutter #tiktok',
    },
  ];

  final List<Widget> _screens = [
    const _FeedScreen(),
    const Center(child: Text('Buscar', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Subir video', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Notificaciones', style: TextStyle(color: Colors.white))),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Subir'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class _FeedScreen extends StatelessWidget {
  const _FeedScreen();

  final List<Map<String, String>> videos = const [
    {
      'url': 'https://www.w3schools.com/html/mov_bbb.mp4',
      'username': 'usuario1',
      'description': '¡Mi primer video! 🎉',
    },
    {
      'url': 'https://www.w3schools.com/html/movie.mp4',
      'username': 'usuario2',
      'description': 'Video increíble 🔥 #flutter #tiktok',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoPlayerItem(
          videoUrl: videos[index]['url']!,
          username: videos[index]['username']!,
          description: videos[index]['description']!,
        );
      },
    );
  }
}