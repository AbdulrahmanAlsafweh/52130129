import 'package:flutter/material.dart';
import 'choosencategory.dart';
import 'favorite.dart';
class Category{

  String type;
  Color color;
  Category(this.type,{Color ? color}) : color =color ??Colors.grey;



}
List<Category> categories =[
  Category("Entertainment", color :Colors.yellow),
  Category("Sport" , color:Colors.blue),
  Category("War", color: Colors.red),
  Category("Art", color: Colors.green),
  Category("Science",  color: Colors.deepOrangeAccent),

];

class ShowCategories extends StatelessWidget {
  const ShowCategories({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {


            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChosenCategory(),
              settings: RouteSettings(arguments: categories[index].type),
            ));
          },
          child: Row(
            children: [
              SizedBox(width: 15),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: categories[index].color,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  padding: EdgeInsets.all(30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Text(
                      categories[index].type,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,)
            ],
          ),
        );
      },
    );
  }
}
