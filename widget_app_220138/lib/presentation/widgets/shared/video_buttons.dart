import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:widget_app_220138/config/helpers/human_formats.dart';
import 'package:widget_app_220138/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconColor: Colors.red,
          iconData: Icons.favorite,
        ),
        const SizedBox(height: 20),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20),
        _CustomIconButton(value: 0, iconData: Icons.comment),
        const SizedBox(height: 20),
        _CustomIconButton(value: 0, iconData: Icons.share_outlined),
        const SizedBox(height: 20),
        const _PlayPauseButton(size: 35),
      ],
    );
  }
}

class _PlayPauseButton extends StatefulWidget {
  final double size;

  const _PlayPauseButton({super.key, this.size = 30});

  @override
  State<_PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<_PlayPauseButton> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        size: widget.size,
        color: Colors.blueGrey,

      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  final double size;

  const _CustomIconButton({
    super.key,
    required this.value,
    required this.iconData,
    iconColor,
    this.size = 30,
  }) : color = iconColor ?? Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color, size: size),
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}
