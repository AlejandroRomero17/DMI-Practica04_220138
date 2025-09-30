import 'package:flutter/material.dart';
import 'package:widget_app_220138/domain/entities/video_post.dart';


class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //todo: cargar videos
    notifyListeners(); 
  }
}
