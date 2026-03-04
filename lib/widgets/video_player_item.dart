import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String username;
  final String description;

  const VideoPlayerItem({
    super.key,
    required this.videoUrl,
    required this.username,
    required this.description,
  });

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  int likes = 0;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              GestureDetector(
                onTap: _toggleLike,
                child: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 40,
                ),
              ),
              Text('$likes', style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              const Icon(Icons.comment, color: Colors.white, size: 40),
              const Text('0', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              const Icon(Icons.share, color: Colors.white, size: 40),
              const Text('Compartir',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
        Positioned(
          left: 10,
          bottom: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@${widget.username}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.description,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}