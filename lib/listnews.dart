import 'package:flutter/material.dart';
import 'news.dart';
import 'NewsDetailScreen.dart';
import 'categories.dart';
import 'favorite.dart';
class ShowNews extends StatefulWidget {
  const ShowNews({Key? key}) : super(key: key);

  @override
  State<ShowNews> createState() => _ShowNewsState();
}

class _ShowNewsState extends State<ShowNews> {
   addToFavorites(News news) {
     bool isTitleExists = favoritesList.any((element) => element.news == news);
     if (!isTitleExists){
    setState(() {
      favoritesList.add(FavoriteList(news));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to Favorites: ${news.title}'),
      ),
    );}
     else{
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Text('The News Is Already Exist In You Fav List'),
         ),
       );
     }
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Access width and height
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Lebanese News",
          style: TextStyle(
            fontFamily: 'HedvigLettersSerif',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Favorite() ,));
          }, child:Icon(Icons.favorite_rounded),)
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 21,
              fontFamily: 'HedvigLettersSerif',
            ),
          ),
          Container(
            height: 100,
            child: ShowCategories(),
          ),
          Text(
            "News",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 21,
              fontFamily: 'HedvigLettersSerif',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress:(){ addToFavorites(news[index]) ;}
                   ,
                  onTap: () {
                    // Navigate to a new screen when an item is tapped
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      NewsDetailsScreen(),
                    settings: RouteSettings(arguments: news[index])));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  news[index].imageURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Column(
                              children: [

                               Padding(padding: EdgeInsets.only(bottom:25)
                               ,child:Text(news[index].title ) ,
                               ),

                                Padding(
                                  padding: EdgeInsets.only(left: screenWidth / 5),
                                  child: Text(news[index].date,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300
                                  ),),
                                )
                              ],
                            ),
                            flex: 4,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
