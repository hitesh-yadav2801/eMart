import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController{

  var isLoading = false.obs;

  // Text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(email : emailController.text, password : passwordController.text);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(email : email, password : password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Storing data method

  storeUserData({name, password, email}) async {
    DocumentReference store = await firestore.collection(usersCollections).doc(currentUser?.uid);
    store.set({
      'name' : name,
      'password' : password,
      'email' : email,
      'imageUrl' : "",
      'id' : currentUser!.uid
    });
  }

  // signout method>
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch(e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}