import 'dart:convert';

import 'package:new_app/models/article.dart';
import 'package:http/http.dart' ;
//import '../api.dart';
import 'package:dio/dio.dart' ;
import 'package:new_app/models/newscaterogy.dart';
// ignore: non_constant_identifier_names
var data;
var dataCategory;
var dataSearch;
List <Articles> news = [];
List <Articles> categoryNewsList = [];
List <Articles> searchNewsList = [];

class NewsGet{
  //  List <Article> news = [];


Future <void> getNews() async {
  ///==>> String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=0b5e9e50c60048a19d8f05e7f5d2d93c";
  // http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$%7BapiKey%7D
 // http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=0b5e9e50c60048a19d8f05e7f5d2d93c
  //?country=in&sortBy=publishedAt&language=en&apiKey=0b5e9e50c60048a19d8f05e7f5d2d93c'
  var url1 = Uri.http('newsapi.org','/v2/top-headlines',{"country":"in","sortBy":"publishedAt","language":"en","apiKey":"0b5e9e50c60048a19d8f05e7f5d2d93c"});
  
  try{ 
   var response = await  get(url1);
    // response = await Dio().get(url);
  print(response.toString());
  
     var jsonData = jsonDecode(response.body);
  // print(jsonData["article"].title);
  response.statusCode ==200?print('ok'):print('bad');
 // if(jsonData["status"]=="ok"){
   // jsonData["articles"].forEach((element){
     // if(element['urlToImage'] != null && element['description'] != null){
          // Article article = Article(
          //   title: element["title"],
          //   author: element["author"],
          //   description: element["description"],
          //   urlToImage: element["urlToImage"],
          //   publshedAt: DateTime.parse(element["publishedAt"]),
          //   content: element["content"],
          //   articleUrl: element["url"],
          // );

          //news.add(article);
          // print(article.title.toString());
          //(article.title)!=null? print("1"):print("2");
      //    print("Ritik");
        //}
        
     
    //});
    // return news;
   // print(news.length);
  //}

    data= News.fromJson(jsonData);
   //print(data.articles![1].title);
  //  print(data.articles![2].title);
   news =data.articles!;

    }
  catch(e){
   print(e);
  }

}
}


Future <void> getCategoryNews(String category) async{
    var url = Uri.http('newsapi.org','/v2/top-headlines',{"country":"in","category":category,"sortBy":"publishedAt","language":"en","apiKey":"0b5e9e50c60048a19d8f05e7f5d2d93c"});

  try{
    var response = await get(url);
   var jsonData = jsonDecode(response.body);
    dataCategory = CategoryNew.fromJson(jsonData);
    categoryNewsList = dataCategory.articles!;

  }
  catch(e){
    print(e);
  }
}

Future <void> getSearchedNews (String query) async {
  var url = Uri.https('newsapi.org', '/v2/everything',{"q":query,"from":"2022-01-19","to":"2022-01-20","sortBy":"popularity","apiKey":"0b5e9e50c60048a19d8f05e7f5d2d93c"});
  // var url1 ="https://newsapi.org/v2/everything?q=apple&from=2022-01-18&to=2022-01-18&sortBy=popularity&apiKey=0b5e9e50c60048a19d8f05e7f5d2d93c";
 Future.delayed(Duration(seconds: 1));
  try{
    var response = await get(url);
   var jsonData = jsonDecode(response.body);
    dataSearch = SearchNew.fromJson(jsonData);
    searchNewsList = dataSearch.articles!;
  }
  catch(err){print(err);}
}