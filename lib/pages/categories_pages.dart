import 'package:flutter/material.dart';
import 'package:new_app/pages/home.dart';
import '../helper/news.dart';
import '../widgets/news_tile.dart';


 class CategoriesPages extends StatefulWidget {
    final String imgAssetUrl,name;

   const CategoriesPages({ Key? key ,required this.imgAssetUrl,required this.name}) : super(key: key);
 
   @override
   _CategoriesPagesState createState() => _CategoriesPagesState();
 }
 
 class _CategoriesPagesState extends State<CategoriesPages> {
   bool CatgoryLoading = true;
  void getCatNews() async{
     await getCategoryNews(widget.name);
     setState(() {
       CatgoryLoading=false;
     });
  }
   @override
  void initState() {
    
     super.initState();
     getCatNews();

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
      body: CatgoryLoading?const Center(
       child:  CircularProgressIndicator(
         color:  Colors.black12,
         semanticsLabel: "Wait",
         strokeWidth: 6,
       ),
     ): SingleChildScrollView(
       child: Container(
         width: size.width,
         color: Colors.grey.withOpacity(0.5),
         child: Column(
           children: [
             Hero(
               tag: widget.name,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 15,),
                     child: Container(
                           margin: const EdgeInsets.only(right: 15),
                           child: Stack(
                             children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            widget.imgAssetUrl,
                            width: size.width*0.8,
                            height: size.height*0.08,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.center,
                        height: size.height*0.08,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), color: Colors.black26),
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                             ],
                           ),
                         ),
                   ),
                 ],
               ),
             ),
             Container(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const ClampingScrollPhysics(),
                            //itemCount: newslist.length,
                            itemCount: dataCategory.articles!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // return Image.network(newslist[index].urlToImage,
                              // height: 100,
                              // width: 100,);
                              // print("/n/n/n"+newslist.length.toString());
                              // return Text(
                              //   dataCategory.articles![index].title
                              //   );
                              // return Container(
                              //   margin: EdgeInsets.all(5),
                              //   height: 50
                              //   ,color: Colors.red,);
                             // print(dataCategory.articles!.length.toString());
  //                          Source? source;
  // String? author;
  // String? title;
  // String? description;
  // String? url;
  // String? urlToImage;
  // String? publishedAt;
  // String? content;

                              return (dataCategory.articles![index].title == null &&
                                      dataCategory.articles![index].description == null &&
                                      dataCategory.articles![index].urlToImage == null &&
                                      dataCategory.articles![index].url == null &&
                                      categoryNewsList[index].content == null&&
                                      dataCategory.articles![index].author == null)
                                  ? const SizedBox(width: 0.0,height: 0.0,)
                                  : NewsTile(
                                      imgUrl: dataCategory.articles![index].urlToImage,
                                      desc: dataCategory.articles![index].description,
                                      title: dataCategory.articles![index].title,
                                      content: dataCategory.articles![index].content,
                                      posturl: dataCategory.articles![index].url);
                            }),
                      )


           ],
         ),
       ),
     ),
     );
   }
 }