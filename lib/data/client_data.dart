import 'package:cloud_firestore/cloud_firestore.dart';

class ClientData {
  String id;
  String uid;

  String name;
  String phone;
  String cpf;
  String sexo;
  String profession;

  ClientData();

  ClientData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    uid = snapshot.data['uid'];
    name = snapshot.data['name'];
    phone = snapshot.data['phone'];
    cpf = snapshot.data['cpf'];
    sexo = snapshot.data['sexo'];
    profession = snapshot.data['profession'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'cpf': cpf,
      'sexo': sexo,
      'profession': profession
    };
  }
}
