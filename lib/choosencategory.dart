import 'package:flutter/material.dart';
import 'news.dart';
import 'NewsDetailScreen.dart';
import 'main.dart';
import 'favorite.dart';
class ChosenCategory extends StatefulWidget {
  const ChosenCategory({Key? key}) : super(key: key);

  @override
  State<ChosenCategory> createState() => _ChosenCategoryState();
}

class _ChosenCategoryState extends State<ChosenCategory> {
  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context)!.settings.arguments as String;
    Size screenSize = MediaQuery.of(context).size;

    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    // Filter the news based on the chosen category
    List<News> categoryNews = news.where((item) => item.category.type == category).toList();

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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,

        title:
        InkWell(
          onTap: () {

            Navigator.of(context).push(MaterialPageRoute(builder:(context) =>MyApp() ,));
          },
        child:Text(
          "Lebanese News",
          style: TextStyle(
            fontFamily: 'HedvigLettersSerif',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      )),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "$category's News",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 21,
              fontFamily: 'HedvigLettersSerif',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categoryNews.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress:(){ addToFavorites(categoryNews[index]) ;}
                  ,
                  onTap: () {
                    // Navigate to a new screen when an item is tapped
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(),
                      settings: RouteSettings(arguments: categoryNews[index]),
                    ));
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
                                  categoryNews[index].imageURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 25),
                                  child: Text(categoryNews[index].title),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: screenWidth / 5),
                                  child: Text(
                                    categoryNews[index].date,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            flex: 4,
                          ),
                        ],
                      ),
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

