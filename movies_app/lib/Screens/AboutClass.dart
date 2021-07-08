import 'package:flutter/material.dart';
import 'package:movies_app/Responsive.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class AboutMovie extends StatefulWidget {
  String name;
  int popularity;
  int rating;
  String description;
  String Director;
  String Star;
  int year;
  AboutMovie({this.name, this.popularity, this.rating, this.description, this.Director, this.Star, this.year});
  @override
  _AboutMovieState createState() => _AboutMovieState(popularity: popularity, name: name,description: description,Director: Director,rating: rating,Star: Star,year: year);
}

class _AboutMovieState extends State<AboutMovie> {
  @override
  String name;
  int popularity;
  int rating;
  String description;
  String Director;
  String Star;
  int year;
  _AboutMovieState({this.name, this.popularity, this.rating, this.description, this.Director, this.Star, this.year});
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if(Responsive.isDesktop(context)){
      return Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            title: Text(name),
          ),
          body: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                MovieImage(width: width/2, height: height,name: name,),
                DetailBox(popularity: popularity, name: name,rating: rating,year: year,description: description,Star: Star,Director: Director,width: width/2,)

              ],
            ),
          )
      );
    }
    else {
      return Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieImage(height: height, width: width, name: name,),
              DetailBox(popularity: popularity, name: name,rating: rating,year: year,description: description,Star: Star,Director: Director, width: width,)
            ],
          ),
        )
      );
    }

  }
}

class DetailBox extends StatelessWidget {
  String name;
  int popularity;
  int rating;
  String description;
  String Director;
  String Star;
  int year;
  double width;
 DetailBox({this.name, this.popularity, this.rating, this.description, this.Director, this.Star, this.year, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width -80,
      color: Colors.black,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text(name, style: Theme.of(context).textTheme.headline2,),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 50, width: 50, color: Colors.green, child: Center(child: Text(popularity.toString(), style: Theme.of(context).textTheme.headline2,),)),
              Container(child: SmoothStarRating(rating: rating.toDouble(), starCount: 5, isReadOnly: true, color: Colors.white,),),
            ],
          ),
          Container(child: Text("Director : " + Director, style: Theme.of(context).textTheme.headline3 , ),),
          Container(child: Text("Star : " + Star, style: Theme.of(context).textTheme.headline3 ),),
        ],
      ),
    );
  }
}



class MovieImage extends StatelessWidget {
  double width;
  double height;
  String name;
  MovieImage({this.width, this.height, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Images/${name}.jpg",),
          fit: BoxFit.fill
        )
      ),
      height: height - 40,
      width: width,
    );
  }
}

