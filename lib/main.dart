import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_clients_firebase/pages/login/login_page.dart';
import 'package:my_clients_firebase/models/user_model.dart';
import 'package:my_clients_firebase/models/client_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<ClientModel>(
            model: ClientModel(model),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'My Clients',
              theme: ThemeData(
                primaryColor: Color(0xFF673ab7),
                primaryColorDark: Color(0xFF320b86),
                primaryColorLight: Color(0xFF9a67ea),
                secondaryHeaderColor: Color(0xFF00b0ff),
              ),
              home: LoginPage(),
            ),
          );
        },
      ),
    );
  }
}
