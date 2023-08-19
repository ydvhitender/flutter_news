import 'package:flutter/material.dart';
import 'package:flutter_news/components/customListTile.dart';

import 'package:flutter_news/model/article_model.dart';
import 'package:flutter_news/services/api_service.dart';
import 'package:flutter_news/extentions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'RobotoSlab'),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "H E A D L I N E S",
          style: TextStyle(
            color: '#ffffff'.toColor(),
            fontSize: 29,
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: '#000000'.toColor(),
        centerTitle: true,
      ),
      body: Container(
        color: '#464646'.toColor(),
        child: FutureBuilder<List<Article>>(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<Article> articles = snapshot.data!;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], context));
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
