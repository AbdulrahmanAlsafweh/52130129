import 'package:flutter/material.dart';
import 'news.dart';

class NewsDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments passed to this screen
    final News news = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(news.title
        ,style: TextStyle(
            color: Colors.black
          ),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              news.imageURL,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "Date: ${news.date}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Title: ${news.title}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Text(
                news.content
            )
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
