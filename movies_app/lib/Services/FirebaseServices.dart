import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseServices{
   CollectionReference reference = FirebaseFirestore.instance.collection("movies");
   Stream<QuerySnapshot> getMovies(int year){
     return reference.where("year", isEqualTo: year).snapshots();
   }

}