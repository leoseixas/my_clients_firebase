import 'package:flutter/material.dart';
import 'package:my_clients_firebase/models/client_model.dart';
import 'package:my_clients_firebase/models/user_model.dart';
import 'package:my_clients_firebase/pages/login/login_page.dart';
import 'package:my_clients_firebase/pages/create_client/create_client_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_clients_firebase/pages/home/client_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Olá, ${model.userData["name"]}',
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/logout.png',
                    width: 22,
                    height: 22,
                  ),
                  onTap: () {
                    model.signOut(onSuccess: _onSuccess);
                  },
                )
              ],
            );
          },
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Novo cliente'),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateClientPage()));
        },
      ),
      backgroundColor: Colors.grey[200],
      body: ScopedModelDescendant<ClientModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (model.clients == null || model.clients.length == 0) {
            return Center(
              child: Text('Nenhum cliente cadastrado',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            );
          } else {
            return ListView(
              children: <Widget>[
                Column(
                  children: model.clients.map(
                    (client) {
                      return ClientTile(client);
                    },
                  ).toList(),
                )
              ],
            );
          }
        },
      ),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }
}
