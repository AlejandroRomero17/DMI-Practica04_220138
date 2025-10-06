import 'package:flutter/material.dart';
import 'package:widget_app_220138/domain/entities/video_post.dart';
import 'package:widget_app_220138/infraestructure/models/local_video_model.dart';
import 'package:widget_app_220138/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //todo: cargar videos
    await Future.delayed(const Duration(seconds: 3));
    final List<VideoPost> newVideos = videoPost
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
