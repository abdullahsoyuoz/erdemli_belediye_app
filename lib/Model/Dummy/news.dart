import 'dart:math';

import 'package:erdemli_bel_app/Model/Dummy/categories.dart';
import 'package:faker/faker.dart';

String videoUrl = "vvED8ENPAlQ";

class News {
  String title;
  String description;
  String imageUrl;
  String videoUrl;
  List<String> photosUrl;
  bool containVideo;
  bool containPhotos;
  DateTime dateTime;
  Categories category;
  News({
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.title,
    this.containVideo = false,
    this.containPhotos = false,
    this.dateTime,
    this.category,
    this.photosUrl,
  });
}

List<News> newsList = List.generate(40, (index) {
  var rand = Random().nextBool();
  var randPhoto = Random().nextBool();
  return News(
      title: "Tatilcilerin Gözdesi Karavan Park",
      description: "Deniz,  kum, güneş ve doğa ile iç içe tatil geçirmek isteyenler, çadır ve karavan turizmine yöneliyor,  yüzleri gülüyor.",
      imageUrl: "https://erdemli.bel.tr/tema/belediye/uploads/haberler/manset/tatilcilerin-gozdesi-karavan-park.jpg",
      videoUrl: videoUrl,
      containVideo: rand,
      containPhotos: randPhoto,
      dateTime: DateTime.now(),
      category: categoryList[Random().nextInt(categoryList.length)],
      photosUrl: [
        "https://www.erdemli.bel.tr/tema/belediye/uploads/projeler/doga-mufettisleri-ve-cocuk-serasi.jpeg",
        "https://www.erdemli.bel.tr/tema/belediye/uploads/projeler/diger/WhatsApp_Image_2022-02-14_at_10.39.10_1.jpeg"
      ]);
});
