//import 'dart:html';

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foods/models/user.dart';


class UserServices{
  String collection = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    // ignore: unused_local_variable
    CollectionReference users = FirebaseFirestore.instance.collection(id);
    // _firestore.collection(collection).document(id).setData(values);
  }

  void updateUserData(Map<String, dynamic> values){
  //  _firestore.collection(values['id']).updateData(values);
  // users.document(uid).updateData();
  _firestore.collection((values['id']).updateData(values));
  }
// _firestore.collection(collection).document(values['id']).updateData(values);

  Future<UserModel> getUserById(String id) => _firestore.collection(collection).doc(id).get().then((doc){
    return UserModel.fromSnapshot(doc);
  });
}

// class UserServices {
//   String collection = "users";
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   //Firestore _firestore = Firestore.instance;

// void createUser(Map<String, dynamic> values) {
//   String id = values["id"];
//   //_firestore.collection(id).setData(values);
//   // _firestore.collection(collection).doc(id).set(values);
//   _firestore.collection(collection).document(id).setData(values);

// }

// void updateUserData(Map<String, dynamic> values) {
//   //_firestore.collection(collection).document(values['id']).updateData(values);
//   //  _firestore.collection((values['id']).updateData(values));
//   _firestore.collection(collection).document(values['id']).updateData(values);
                      

// }

// // Future<UserModel> getUserById(String id) => 
// //   _firestore.collection(collection).doc(id).get().then((doc){
// //   //  _firestore.collection(collection).document(id).get().then((doc){
// //   return UserModel.fromSnapshot(doc);
// // }); 
// Future<UserModel> getUserById(String id) => 
// _firestore.collection(collection).document(id).get().then((doc){
//     return UserModel.fromSnapshot(doc);
//   });



// }