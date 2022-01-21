import 'package:flutter/material.dart';
import 'package:new_app/helper/news.dart';
import 'package:new_app/models/article.dart';
import 'package:new_app/models/newscaterogy.dart';
import 'package:new_app/pages/search_news.dart';
import 'package:new_app/pages/web_view_page.dart';
import '../pages/categories_pages.dart';
import '../widgets/news_tile.dart';

double w = 0.0;
double h = 0.0;
List<Articles> articles = [];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  bool _loading = true;
  List<News> newslist = [];
  String buttonState = "none";
  getnews() async {
    NewsGet newstemp = NewsGet();
    await newstemp.getNews();
    setState(() {
      _loading = false;
    });
    //  newslist =
  }

  @override
  void initState() {
    super.initState();
    // getNews();
    getnews();
  }

  Widget navBar() {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){setState(() {
                buttonState = "category";
              });},
              child: Container(
                height: h*0.07,
                width: w*0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration( color: Colors.grey.withOpacity(0.8),
                   borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const  Text("Caterogies",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),))),
                SizedBox(width: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  buttonState = "search";
                });
              },
              child: Container(
                height: h*0.07,
                width: w*0.4,
                alignment: Alignment.center,
                decoration: BoxDecoration( color: Colors.grey.withOpacity(0.8),
                   borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Text("Search",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),))),
            // ElevatedButton(onPressed: (){
            //   setState(() {
            //     buttonState = "country";
            //   });
            // }, child: const Text("Countries")),
          ],
        ),
      ),
    );
  }

  Widget categoryBlock() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        //color: Colors.red,
        height: h * 0.13,
        color: Colors.grey.withOpacity(0.5),
        //  const Color.fromRGBO(256, 250, 250, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         buttonState = "none";
            //       });
            //     },
            //     child: const Text("back")),
            
            Container(
              height: 60,
              width: w ,
              // color: Colors.black,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryNews.length+1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return index == 0 ? InkWell(
              onTap: (){
                setState(() {
                  buttonState = "none";
                });
              },
              child: Container(
                height:  60,
                width: 120,
                margin: const EdgeInsets.only(right: 15),
                alignment: Alignment.center,
               
                decoration: BoxDecoration(
                   color: Colors.grey.withOpacity(0.9),
                   borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: const Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
              ),
            ):CategoryCard(
                      imgUrl: categoryNews[index-1].imgUrl,
                      name: categoryNews[index-1].categoryName,
                    ) ;
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox(){
    return Container(
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField (  
          controller: searchController,
  decoration:  InputDecoration(  
    prefixIcon: InkWell(
      onTap: (){
        setState(() {
          buttonState = "none";
        });
      },
      child: Icon(Icons.arrow_back,color:Colors.black)),
    suffixIcon: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchedNews(searchItem: searchController.text,)));
        },
        child: const Icon(Icons.search,color: Colors.black,)),
    border: const OutlineInputBorder(),  
    labelText: 'Search',  
    hintText: 'Search'  
  ),  
),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.black26,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Ne',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            Text('ws'),
            Text(
              'yy',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            )
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black12,
                strokeWidth: 6,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    buttonState == "none" ? navBar() : buttonState=="category"? categoryBlock():searchBox(),
                    const Divider(
                      thickness: 0.0,
                      height: 0.0,
                    ),
                    Container(
                      width: w,
                      // height: h,
                      color: Colors.grey.withOpacity(0.5),
                      // color:const  Color.fromRGBO(256, 250, 250, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const ClampingScrollPhysics(),
                            //itemCount: newslist.length,
                            itemCount: data.articles!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // return Image.network(newslist[index].urlToImage,
                              // height: 100,
                              // width: 100,);
                              // print("/n/n/n"+newslist.length.toString());
                              // return Text(
                              //   data.articles![index].title
                              //   );
                              // return Container(
                              //   margin: EdgeInsets.all(5),
                              //   height: 50
                              //   ,color: Colors.red,);
                              // print(data.articles!.length.toString());

                              return data.articles![index].title == null &&
                                      data.articles![index].description ==
                                          null &&
                                      data.articles![index].urlToImage ==
                                          null &&
                                      data.articles![index].url == null &&
                                      news[index].content == null
                                  ? const SizedBox(
                                      width: 0.0,
                                      height: 0.0,
                                    )
                                  : NewsTile(
                                      imgUrl: data.articles![index].urlToImage,
                                      desc: data.articles![index].description,
                                      title: data.articles![index].title,
                                      content: data.articles![index].content,
                                      posturl: data.articles![index].url);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imgUrl, name;
  // ignore: use_key_in_widget_constructors
  const CategoryCard({required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriesPages(
                      imgAssetUrl: imgUrl,
                      name: name,
                    )));
      },
      child: Hero(
        tag: name,
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imgUrl,
                    width: 120,
                    height: 60,
                    fit: BoxFit.cover,
                  )),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black26),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
