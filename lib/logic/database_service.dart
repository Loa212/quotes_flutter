import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore;

  DatabaseService(this._firebaseFirestore);

  //CollectionReference user = FirebaseFirestore.instance.collection(uid);
  String time = DateTime.now().toString();

  Future<void> addQuote({String uid, String title, String text, String mood}) {
    time = DateTime.now().toString();

    return _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('quotes')
        .doc(time)
        .set(
      {
        'Title': title,
        'text': text,
        'mood': mood,
      },
    );
  }

  Future<void> addToFavorites({String uid, String author, String quote}) {
    return _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc('1')
        .set(
      {
        'Author': author,
        'Quote': quote,
      },
    );
  }

  Future<void> updateQuote(
      {String uid, String title, String text, String mood, String doc}) {
    time = DateTime.now().toString();

    return _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('quotes')
        .doc(doc)
        .set(
      {
        'Title': title,
        'text': text,
        'mood': mood,
      },
    );
  }
}
