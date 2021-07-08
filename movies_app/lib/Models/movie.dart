import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Movie{
  int year;
  String name;
  String description;
  String genre;
  int rating;
  int popularity;

  DocumentReference refrence;
  Movie({this.year, this.name, this.description, this.genre, this.rating, this.popularity});

  factory Movie.fromJson(Map<dynamic, dynamic> json) => _MovieFromJson(json);

}

 Movie _MovieFromJson(Map<dynamic, dynamic> json){
    return Movie();
 }