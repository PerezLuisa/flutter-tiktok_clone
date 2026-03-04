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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video de fondo
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

        // Botones derecha
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              // Like
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    likes += isLiked ? 1 : -1;
                  });
                },
                child: Column(