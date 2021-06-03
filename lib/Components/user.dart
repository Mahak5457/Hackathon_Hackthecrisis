import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {

  String name;
  String userName;
  String email;
  String phoneNo;
  String job;
  var password;
  final auth = FirebaseAuth.instance;
  Future authState() async{
    // await Firebase.initializeApp() as FirebaseApp;
    await FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
        return false;
      } else {
        print('User is signed in!');
        return user;
      }
    });
  }

  Future Login() async {
    // await Firebase.initializeApp() as FirebaseApp;
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
    }
  }

  Future Registration() async {

    // await Firebase.initializeApp() as FirebaseApp;
    try {
      print('done');
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      print('done');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future storeData() async{
    // await Firebase.initializeApp() as FirebaseApp;
    await FirebaseFirestore.instance.collection('Users').add({
      'Name' : name,
      'Email' : email,
      'Contact' : phoneNo,
      'Job' : job,
    });
    print('value added');
  }

  Future getData() async{
    var user = await authState();
    await FirebaseFirestore.instance
        .collection('users')
        .where('ID', isEqualTo: user.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            name = doc['Name'];
            email = doc['Email'];
            phoneNo = doc['Contact'];
            job = doc['Job'];
            userName = doc['User Name'];

          });
    });
  }
}