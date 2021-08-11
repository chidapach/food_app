 //import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foods/helpers/user.dart';
import 'package:foods/models/user.dart';
 
enum Status{Uninitialized, Authenticated, Authenticating, Unauthenticated}
 
class  AuthProvider with ChangeNotifier{
 
 FirebaseAuth _auth;
 late User _user;
 Status _status = Status.Uninitialized;
 FirebaseFirestore _firestore = FirebaseFirestore.instance;
 UserServices _userServicse = UserServices();
 late UserModel _userModel;
 
 
 //getters
 Status get status => _status;
 UserModel get userModel => _userModel;
 User get user => _user;  // FirebaseUser get user => _user;
 
 final formKey = GlobalKey<FormState>();
 
 TextEditingController email = TextEditingController();
 TextEditingController name = TextEditingController();
 TextEditingController password = TextEditingController(); 
 
   AuthProvider.initialize(): _auth = FirebaseAuth.instance {

  // ignore: unnecessary_statements
  // _auth.authStateChanges().listen;

 }
 
 Future<bool> signIn()async{
   try{
     _status = Status.Authenticating;
     notifyListeners();
     await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
     return true;
   }catch(e){
     _status = Status.Unauthenticated;
     notifyListeners();
     print(e.toString());
     return false;
   }
 }
 
 Future<bool> signUp()async{
   try{
     _status = Status.Authenticating;
     notifyListeners();
     await _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result){
      //_firestore.collection('users').doc(result.user.uid).setData({
       _firestore.collection('users').doc(result.user!.uid).set
       ({
         'name':name.text,
         'email':email.text,
         'uid':result.user!.uid,
         // "likedFood": [],
         // "likedRestaurants": []
       });
     });
     return true;
   }catch(e){
     _status = Status.Unauthenticated;
     notifyListeners();
     print(e.toString());
     return false;
   }
 }
 
 Future signOut()async{
   _auth.signOut();
   _status = Status.Unauthenticated;
   notifyListeners();
   return Future.delayed(Duration.zero);
 }
 
 void clearController(){
   name.text = "";
   password.text = "";
   email.text = "";
 }
 
 Future<void> reloadUserModel()async{
   _userModel = await _userServicse.getUserById(user.uid);
   notifyListeners();
 }
 
 
 // ignore: unused_element
 Future<void> _onStateChanged(User firebaseUser) async{
   // ignore: unnecessary_null_comparison
   if(firebaseUser == null){
     _status = Status.Unauthenticated;
   }else{
     _user = firebaseUser;
     _status = Status.Authenticated;
     _userModel = await _userServicse.getUserById(user.uid);
   }
   notifyListeners();
   
 }
    
}

