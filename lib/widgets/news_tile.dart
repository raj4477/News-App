import 'package:flutter/material.dart';
import 'package:new_app/pages/home.dart';
import '../pages/web_view_page.dart';
class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => ArticleView(
        //       postUrl: posturl,
        //     )
        // ));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebPageView(url: posturl)));
        // print(data.articles!);
      },
      child: Container(
          margin: const  EdgeInsets.only(bottom: 28),
          width: MediaQuery.of(context).size.width*0.8,
          child: Material(
        
            borderRadius:const BorderRadius.all(Radius.circular(10)),
            elevation: 10.0,
            child: Container(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  // color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6),
                        bottomLeft: Radius.circular(6))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imgUrl,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        )),
                   const SizedBox(
                      height: 12,
                    ),
                    Text(
                      title,
                      maxLines: 2,
                      style: const  TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      desc,
                      maxLines: 2,
                      style:  const TextStyle(color: Colors.black54, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}