import 'package:flutter/material.dart';
import '../helper/news.dart';
import '../widgets/news_tile.dart';

class SearchedNews extends StatefulWidget {
    final String searchItem;

   const SearchedNews({ Key? key ,required this.searchItem}) : super(key: key);
 
   @override
   _SearchedNewsState createState() => _SearchedNewsState();
 }
 
 class _SearchedNewsState extends State<SearchedNews> {
   bool searchNewsLoading = true;
  void getserchNews() async{
     await getSearchedNews(widget.searchItem);
     setState(() {
       searchNewsLoading=false;
     });
  }
   @override
  void initState() {
    
     super.initState();
     getserchNews();

  }
   @override
   Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
     return Scaffold(
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black26,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text('Ne',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.orange),),
          Text('ws'),
          Text('yy',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.green),)],
        ),
      ),
      body: searchNewsLoading?const Center(
       child:  CircularProgressIndicator(
         color:  Colors.black12,
         strokeWidth: 6,
       ),
     ): SingleChildScrollView(
       child: Column(
         children: [
           
           Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          //itemCount: newslist.length,
                          itemCount: dataSearch.articles!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                           
                            return (dataSearch.articles![index].title == null &&
                                    dataSearch.articles![index].description == null &&
                                    dataSearch.articles![index].urlToImage == null &&
                                    dataSearch.articles![index].url == null &&
                                    searchNewsList[index].content == null&&
                                    dataSearch.articles![index].author == null)
                                ? const SizedBox(width: 0.0,height: 0.0,)
                                : NewsTile(
                                    imgUrl: dataSearch.articles![index].urlToImage,
                                    desc: dataSearch.articles![index].description,
                                    title: dataSearch.articles![index].title,
                                    content: dataSearch.articles![index].content,
                                    posturl: dataSearch.articles![index].url);
                          }),
                    )


         ],
       ),
     ),
     );
   }
 }