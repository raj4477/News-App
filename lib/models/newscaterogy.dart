// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

class Category {
  final String categoryName ;
  final String imgUrl;
  // Widget? widget;
  Category({required this.categoryName,required this.imgUrl});
}

List <Category> categoryNews = [
  // Category(categoryName: "Back", imgUrl: "assets/images/back.png"),
  Category(categoryName: 'General', imgUrl: 'assets/images/general.jpg'),
  Category(categoryName: 'Health', imgUrl: 'assets/images/health.jpg'),
  Category(categoryName: 'Science', imgUrl: 'assets/images/science.jpg'),
  Category(categoryName: 'Technology', imgUrl: 'assets/images/technology.jpg'),
  Category(categoryName: 'Sports', imgUrl: 'assets/images/sports.jpg'),
  Category(categoryName: 'Bussiness', imgUrl: 'assets/images/bussines.jpg'),
  Category(categoryName: 'Entertainment', imgUrl: 'assets/images/entertainment.jpg')
];
