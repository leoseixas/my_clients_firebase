import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_clients_firebase/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_clients_firebase/data/client_data.dart';

class ClientModel extends Model {
  UserModel user;

  List<ClientData> clients = [];

  ClientModel(this.user) {
    _loadClientItems();
  }

  bool isLoading = false;

  static ClientModel of(BuildContext context) =>
      ScopedModel.of<ClientModel>(context);

  void addClient(
    ClientData clientData,
    @required VoidCallback onSuccess,
  ) async {
    clients.add(clientData);

    await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('clients')
        .add(clientData.toMap())
        .then((doc) {
      clientData.id = doc.documentID;
    });

    onSuccess();

    notifyListeners();
  }

  void removeClient(ClientData clientData) {
    Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('clients')
        .document(clientData.id)
        .delete();

    clients.remove(clientData);
    notifyListeners();
  }

  void _loadClientItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection('users')
        .document(user.firebaseUser.uid)
        .collection('clients')
        .getDocuments();

    clients =
        query.documents.map((doc) => ClientData.fromDocument(doc)).toList();

    notifyListeners();
  }
}
