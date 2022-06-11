import 'package:flutter/material.dart';

class Categories {
  int id;
  String title;
  String imageUrl;
  Color color;
  Categories({
    this.id,
    this.imageUrl,
    this.title,
    this.color,
  });
}

List<Categories> categoryList = [
  Categories(id: 0, title: "Etkinlikler", color: Colors.amber.shade700, imageUrl: "https://images.unsplash.com/photo-1472653431158-6364773b2a56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80"),
  Categories(id: 1, title: "Haberler", color: Colors.redAccent.shade700, imageUrl: "https://images.unsplash.com/photo-1568613444605-b8b0de479bed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80"),
  Categories(id: 2, title: "Duyurular", color: Colors.cyanAccent.shade700, imageUrl: "https://images.unsplash.com/photo-1601139144817-358064498084?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80"),
  Categories(id: 3, title: "Cenaze", color: Colors.black, imageUrl: "https://images.unsplash.com/photo-1456659122552-6ee1788174bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80"),
  Categories(id: 4, title: "Projeler", color: Colors.blueAccent.shade700, imageUrl: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80"),
];
