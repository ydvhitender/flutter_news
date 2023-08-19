import 'package:flutter/material.dart';

import 'package:flutter_news/model/article_model.dart';
import 'package:flutter_news/extentions.dart';
import 'package:flutter_news/components/back_button.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                article.urlToImage,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35, right: 20),
                child: RoundedBackButton(),
              ),
              // ignore: unnecessary_null_comparison
              article.urlToImage != null
                  ? const SizedBox(
                      height: 280,
                      width: double.infinity,
                    )
                  : Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(''), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  article.title,
                  style: TextStyle(
                    color: '#ffffff'.toColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    article.source.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 212, 211, 211),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 14),
                child: Text(
                  article.description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 216, 214, 214),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
