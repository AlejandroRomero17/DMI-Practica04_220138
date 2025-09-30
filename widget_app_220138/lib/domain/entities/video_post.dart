class VideoPost {
  final String caption; //Titulo del video
  final String videoURL; //Referencia de video corto
  final int likes;
  final int views;
  VideoPost({
    required this.caption,

    required this.videoURL,
    this.likes = 0,
    this.views = 0,
  });
}
