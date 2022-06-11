import 'dart:math';

import 'package:erdemli_bel_app/Model/Dummy/categories.dart';
import 'package:faker/faker.dart';

String videoUrl = "vvED8ENPAlQ";

class News {
  String title;
  String description;
  String imageUrl;
  String videoUrl;
  bool containVideo;
  DateTime dateTime;
  Categories category;
  News({
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.title,
    this.containVideo = false,
    this.dateTime,
    this.category,
  });
}

List<News> newsList = List.generate(40, (index) {
  var rand = Random().nextBool();
  return News(
    title: Faker()
        .lorem
        .sentences(2)
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", ""),
    description: Faker()
        .lorem
        .sentences(36)
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", ""),
    imageUrl: Faker().image.image(keywords: ['news']),
    videoUrl: videoUrl,
    containVideo: rand,
    dateTime: DateTime.now(),
    category: categoryList[Random().nextInt(categoryList.length)],
  );
});
