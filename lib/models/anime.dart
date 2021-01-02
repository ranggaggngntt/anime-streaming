
import 'dart:convert';

List<AnimeModel> userModelFromJson(String str) => List<AnimeModel>.from(json.decode(str).map((x) => AnimeModel.fromJson(x)));
class AnimeModel {
  String title;
  String image;
  String description;
  String duration;
  String release;
  String video;

  AnimeModel(
      {this.title, this.image, this.description, this.duration, this.release, this.video});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
        title: json['title'],
        image: json['image'],
        description: json['description'],
        duration: json['duration'],
        release: json['release'],
        video: json['video']);
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "description": description,
    "duration": duration,
    "release": release,
    "video": video
  };
}
