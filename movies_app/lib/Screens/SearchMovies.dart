import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Screens/MovieListPage.dart';

class SearchMoviePage extends StatefulWidget {
  @override
  _SearchMoviePageState createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  @override
  int year = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Movies"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(

          width: (MediaQuery.of(context).size.width * 2.8)/4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("assets/Images/movieIcon.png", height: 200, width: 200,),
              Text("MOVIES", style: Theme.of(context).textTheme.headline1),

              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white),),
                child:  TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (val){
                    setState(() {
                      year = int.parse(val);
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                 if(year < 1950 || year > 2021 ){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text("We only have movies from 1950 to 2021"),
                   ));
                 }
                else{
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => MovieListPage(year: year,)),
                   );
                 }
              },
                  child: Text("Search"),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900]), ),
              )
            ],

          ),
        )
      ),
    );
  }
}


