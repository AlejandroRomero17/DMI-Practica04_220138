import 'package:flutter/material.dart';
import 'package:widget_app_220138/domain/entities/video_post.dart';
import 'package:widget_app_220138/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    // return PageView(children: [Container(color: Colors.red)]);
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(children: [
          Positioned(
            bottom: 40,
            right: 20,
            child: VideoButtons(video: videoPost),
            ),
          // VideoButtons(video: videoPost),
          ],
        );
      },
    );
  }
}
