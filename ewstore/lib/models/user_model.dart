import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

final CollectionReference myCollection = Firestore.instance.collection('Users');

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  AuthResult firebase_user;
  Firestore database;
  String name_user;
  String email_user;
  String PhotoUrl_user;
  Map<String, dynamic> userData = Map();
  bool isLodding = false;
  BuildContext get context => null;
  

  Future<Null> _saveUserData(@required Map<String, dynamic> userData,
      @required AuthResult user) async {
    this.userData = userData;
    Firestore.instance
        .collection("Users")
        .document(user.user.uid)
        .setData(userData);
  }

  void SignUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSucess,
      @required VoidCallback onFail}) {
    isLodding = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      await _saveUserData(
          userData, user); //Salva os demais dados do usuário no  banco
      print("Usuário cadastrado");
      onSucess();
      isLodding = false;
      notifyListeners();
    }).catchError((e) {
      print("-" * 150);
      print("Erro de chamada : " + e.toString());
      print("-" * 150);
      onFail();

      isLodding = false;
      notifyListeners();
    });
  }

  void SignIn(@required String email, @required String pass,
      VoidCallback onSucess, VoidCallback onFail) async {
    isLodding = true;
    notifyListeners(); //atualiza a pagina
    try {
      onSucess();
      FirebaseUser user =
          (await _auth.signInWithEmailAndPassword(email: email, password: pass))
              .user;
      print(user);
      DocumentSnapshot docUser =
          await Firestore.instance.collection("Users").document(user.uid).get();
      firebaseUser = user;
      userData = docUser.data;
      print("-" * 150);
      print(docUser.data);
      print("-" * 150);
      isLodding = false;
      notifyListeners();
    } catch (e) {
      onFail();
      print("-" * 150);
      print("Error : ${e.toString()}");
      print("Error Number: ${e.hashCode}");
      print("Error Type: ${e.runtimeType}");
      print("-" * 150);
      isLodding = false;
      notifyListeners();
    }

    bool isLoggedIn() {
      return firebaseUser != null;
    }

    Future<String> GenerateId() async {
      String id_number = "";
      var gerador = Random();
      for (int x = 0; x < 4; x++) {
        for (int i = 0; i < 4; i++) {
          var number = gerador.nextInt(9);
          id_number = id_number.toString() + number.toString();
        }
        if (x < 3) {
          id_number = id_number + " ";
        }
      }
      List List_of_ids = (await Firestore.instance
              .collection("Users")
              .where("id", arrayContains: id_number)
              .getDocuments())
          .documents;
      if (List_of_ids.isEmpty) {
        return id_number;
      } else {
        GenerateId();
      }
    }

    Future<dynamic> saveImage(@required dynamic image) async {
      try {
        String fileName = 'images/${DateTime.now()}.png';
        StorageReference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(fileName);
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
        return await taskSnapshot.ref.getDownloadURL();
      } catch (e) {
        print("-" * 150);
        print("Erro na mandagem de imagem : " + e.toString());
        print("-" * 150);
      }
    }

    Future<Null> _loadCurrentUser() async {
      try {
        if (firebaseUser == null) {
          firebaseUser = await _auth.currentUser();
        }
        if (firebaseUser != null) {
          if (userData["name"] == null) {
            DocumentSnapshot docUser = await Firestore.instance
                .collection("Users")
                .document("admin")
                .get();
            userData = docUser.data;
            debugPrint("Usuario: ${docUser.data}");
          }
        }
        notifyListeners();
      } catch (e) {
        print("=" * 150);
        print("Erro ao carregar o usuário atual: ${e.toString()}");
        print("=" * 150);
      }
    }

    bool validateData (@required Map<String, dynamic> userData) async {
      for (int i=0;i<WrongNames.length();i++){

      }
    }
  }
}
