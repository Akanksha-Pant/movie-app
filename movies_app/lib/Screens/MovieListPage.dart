import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Components/MovieCard.dart';
import 'package:movies_app/Responsive.dart';
import 'package:movies_app/Services/FirebaseServices.dart';

class MovieListPage extends StatefulWidget {
  int year;
  MovieListPage({this.year});
  @override
  _MovieListPageState createState() => _MovieListPageState(year: year);
}

class _MovieListPageState extends State<MovieListPage> {
   int year;
  _MovieListPageState({this.year});
  FirebaseServices services = new FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Movies", ),
      ),
      body: Center(

        child:StreamBuilder<QuerySnapshot>(
            stream: services.getMovies(year),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              else{
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return documents.length == 0?  Container(child: Text("No Movies Found"),) :
                GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isDesktop(context) ?  6.0 : Responsive.isTablet(context) ? 5 : 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    children: documents
                        .map((doc) => MovieCard(
                      name: doc["name"],
                      popularity: doc["popularity"],
                      rating: doc["rating"],
                      year: doc["year"],
                      description: doc["description"],
                      Director: doc["Director"],
                      Star: doc["Star"],
                    )).toList()
                );
              }
            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
