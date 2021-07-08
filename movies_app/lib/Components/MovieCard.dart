import 'package:flutter/material.dart';
import 'package:movies_app/Screens/AboutClass.dart';


class MovieCard extends StatelessWidget {
  String name;
  int popularity;
  int rating;
  String description;
  String Director;
  String Star;
  int year;
  MovieCard({this.name, this.popularity, this.rating, this.description, this.Director, this.Star, this.year});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutMovie(
            Star: Star,
            Director: Director,
            description: description,
            year: year,
            rating: rating,
            name: name,
            popularity: popularity,
          )),
        );
      },
      child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FittedBox(

              child: Image.asset("assets/Images/${name}.jpg", fit: BoxFit.fitWidth,height: 200,width: 250,),
              fit: BoxFit.fill,
            ),
           Center(child:  Text(name, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),),)

          ],
        ),
      ),
    );
  }
}
