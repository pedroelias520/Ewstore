import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/screens/test_screen.dart';
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
  Map<String, dynamic> levels = Map();
  Map<String, dynamic> levelCurrentUser = Map();
  

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

      Future getLevels() async {
    debugPrint("===========================");    
    var level = await Firestore.instance.collection("Commons").document("Levels").get();    
    levels = level.data; 
    debugPrint(levels.toString());
    debugPrint("Data updated");
    debugPrint("===========================");  
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

    Future<Map> getLevelUser(@required Map<String, dynamic> userData) async {
      getLevels();
      for(int i=0;i<31;i++){
          if(userData["level"]>levels["Level ${i}"] && userData["level"]<levels["Level ${i+1}"]){
            levelCurrentUser["Current Level User"] = i;
            levelCurrentUser["Next Level"] = i+1;
          }
      }

    
      return levelCurrentUser;
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

    Future<bool> validateData (@required Map<String, dynamic> userData) async {
      DocumentSnapshot WrongNames = await Firestore.instance.collection("Users").document("admin").get();
      for (int i=0;i<WrongNames.data.length;i++){
        if(userData['name'] == WrongNames.data.values) {
          return false;
        }
        else{
          return true;
        }
      }
    }

    void addWrongNames () async {
    try{    
    List<String> wrongNames = ['Anus','Babaovo','Babaovo','Babaca','Bacura','Bagos','Baitola','Bebum','Besta','BichaBisca','Bixa','Boazuda','Boceta','Boco','Boiola','Bolagato','Boquete','Bolcat','Bosseta','Bosta','Bostana','Brecha','Brexa','Brioco','Bronha','Buca','Buceta','Bunda','Bunduda','Burra','Burro','Busseta','Cachorra','Cachorro','Cadela','Caga','Cagado','Cagao','Cagona','Canalha','Caralho','Casseta','Cassete','Checheca','Chereca','Chibumba','Chibumbo','Chifruda','Chifrudo','Chota','Chochota','Chupada','Chupado','Clitoris','Cocaina','Coco','Corna','Corno','Cornuda','Cornudo','Corrupta','Corrupto','Cretina','Cretino','Cruz-credo','Cu','Culhao','Curalho','Cuzao','Cuzuda','Cuzudo','Debil','Debiloide','Defunto','Demonio','Difunto','Doida','Doido','Egua','Escrota','Escroto','Esporrada','Esporrado','Esporro','Estupida','Estupidez','Estupido','Fedida','Fedido','Fedor','Fedorenta','Feia','Feio','Feiosa','Feioso','Feioza','Feiozo','Felacao','Fenda','Foda','Fodao','Fode','FodidaFodido','Fornica','Fudendo','Fudecao','Fudida','Fudido','Furada','Furado','Furão','Furnica','Furnicar','Furo','Furona','Gaiata','Gaiato','Gay','Gonorrea','Gonorreia','Gosma','Gosmenta','Gosmento','Grelinho','Grelo','Homo-sexual','Homossexual','Homossexual','Idiota','Idiotice','Imbecil','Iscrota','Iscroto','Japa','Ladra','Ladrao','Ladroeira','Ladrona','Lalau','Leprosa','Leproso','Lésbica','Macaca','Macaco','Machona','Machorra','Manguaca','Mangua¦a','Masturba','Meleca','Merda','Mija','Mijada','Mijado','Mijo','Mocrea','Mocreia','Moleca','Moleque','Mondronga','Mondrongo','Naba','Nadega','Nojeira','Nojenta','Nojento','Nojo','Olhota','Otaria','Ot-ria','Otario','Ot-rio','Paca','Paspalha','Paspalhao','Paspalho','Pau','Peia','Peido','Pemba','Pênis','Pentelha','Pentelho','Perereca','Peru','Pica','Picao','Pilantra','Piranha','Piroca','Piroco','Piru','Porra','Prega','Prostibulo','Prost-bulo','Prostituta','Prostituto','Punheta','Punhetao','Pus','Pustula','Puta','Puto','Puxa-saco','Puxasaco','Rabao','Rabo','Rabuda','Rabudao','Rabudo','Rabudona','Racha','Rachada','Rachadao','Rachadinha','Rachadinho','Rachado','Ramela','Remela','Retardada','Retardado','Ridícula','Rola','Rolinha','Rosca','Sacana','Safada','Safado','Sapatao','Sifilis','Siririca','Tarad','Tarado','Testuda','Tezao','Tezuda','Tezudo','Trocha','Trolha','Troucha','Trouxa','Troxa','Vaca','Vagabunda','Vagabundo','Vagina','Veada','Veadao','Veado','Viad','Viado','Viadao','Xavasca','Xerereca','Xexec','Xibiu','Xibumba','Xot','Xochota','Xoxota','Xan','Xaninha']; 
    for (int i=0;i<wrongNames.length;i++){
      Firestore.instance.collection('Commons').document('Words').setData({"wrongName":wrongNames[i]});
    }    
  }catch(e){
    debugPrint("===========================");
    debugPrint('Error to add on Firestore');
    debugPrint(e.toString());
    debugPrint("===========================");
  }
    }

  }
}
