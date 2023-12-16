import 'package:flutter/material.dart';
import 'NewsDetailScreen.dart';
import 'news.dart';

class FavoriteList {
  News news;
  FavoriteList(this.news);
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

List<FavoriteList> favoritesList = [];

enum SortingOption {
  None,
  AlphabeticalAsc,
  AlphabeticalDesc,
}

class _FavoriteState extends State<Favorite> {
  List<FavoriteList> filteredFavorites = List.from(favoritesList);
  SortingOption selectedSortingOption = SortingOption.None;

  void deleteFromFav(News news) {
    setState(() {
      favoritesList.removeWhere((item) => item.news == news);
      filteredFavorites = List.from(favoritesList);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${news.title} has been removed from the favorite list'),
      ),
    );
  }

  void filterFavorites(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredFavorites = List.from(favoritesList);
      } else {
        filteredFavorites = favoritesList
            .where((favorite) =>
            favorite.news.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void sortFavorites() {
    setState(() {
      switch (selectedSortingOption) {
        case SortingOption.AlphabeticalAsc:
          filteredFavorites.sort((a, b) =>
              a.news.title.toLowerCase().compareTo(b.news.title.toLowerCase()));
          break;
        case SortingOption.AlphabeticalDesc:
          filteredFavorites.sort((a, b) =>
              b.news.title.toLowerCase().compareTo(a.news.title.toLowerCase()));
          break;
        case SortingOption.None:
        // Do nothing
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        actions: [
          Row(
            children: [
              Text("Sort By:"),
              DropdownButton(
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
                value: selectedSortingOption,
                items: [
                  DropdownMenuItem(
                    value: SortingOption.None,
                    child: Text("None"),
                  ),
                  DropdownMenuItem(
                    value: SortingOption.AlphabeticalAsc,
                    child: Text("A-Z"),
                  ),
                  DropdownMenuItem(
                    value: SortingOption.AlphabeticalDesc,
                    child: Text("Z-A"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSortingOption = value!;
                    sortFavorites();
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  filterFavorites(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Text(
              'Your Favorites',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Adjust color as needed
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFavorites.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onLongPress: () {
                            deleteFromFav(filteredFavorites[index].news);
                          },
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => NewsDetailsScreen(),
                                settings: RouteSettings(
                                  arguments: filteredFavorites[index].news,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                filteredFavorites[index].news.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
