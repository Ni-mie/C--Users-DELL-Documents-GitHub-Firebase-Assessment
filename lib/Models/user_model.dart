import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? docId;
  String? name;
  String? email;
  String? address;
  String? phonenumber;

  UserModel(
      {this.docId, this.name, this.email, this.phonenumber, this.address});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    docId = documentSnapshot.id;
    name = documentSnapshot['name'];
    email = documentSnapshot['email'];
    address = documentSnapshot['address'];
    phonenumber = documentSnapshot['phonenumber'];
  }

  static fromMap(QueryDocumentSnapshot<Object?> item) {}
}
