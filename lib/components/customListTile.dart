import 'package:flutter/material.dart';
import 'package:flutter_news/model/article_model.dart';
import 'package:flutter_news/pages/articles_details_page.dart';
import 'package:flutter_news/extentions.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: '#000000'.toColor(),
        image: DecorationImage(
          image: NetworkImage(article.urlToImage),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          article.urlToImage != null
              ? Container(
                  height: 120.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYFFkZApAcuhu3wkauX3O-dx3CtDd0zo_Mti6Zw0rjEtPf3-BGrXnXTL40fmqvxi8gBqY&usqp=CAU"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
          const SizedBox(height: 8.0),
          Text(
            article.title,
            style: TextStyle(
              fontFamily: 'RobotoSlab',
              color: '#f2f2f2'.toColor(),
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              article.source.name,
              style: TextStyle(
                fontSize: 12,
                color: '#bababa'.toColor(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
