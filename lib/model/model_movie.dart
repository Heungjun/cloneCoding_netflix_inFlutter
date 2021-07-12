import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  String title;
  String keyword;
  String poster;
  bool like;
  DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  Movie.fromSnapShot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => 'Movie<$title:$keyword>';
}
