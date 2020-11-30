import 'package:flutter/material.dart';
import 'package:my_clients_firebase/data/client_data.dart';
import 'package:my_clients_firebase/models/client_model.dart';
import 'package:my_clients_firebase/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateClientPage extends StatefulWidget {
  @override
  _CreateClientPageState createState() => _CreateClientPageState();
}

class _CreateClientPageState extends State<CreateClientPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _sexoController = TextEditingController();
  final _professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Novo cliente'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Nome completo",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) return "Nome inválido";
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "Telefone",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty) return "Telefone inválido";
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  hintText: "CPF",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) return "Cpf inválido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _sexoController,
                decoration: InputDecoration(
                  hintText: "Sexo",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) return "Sexo inválido";
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _professionController,
                decoration: InputDecoration(
                  hintText: "Profissão",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) return "Profissão inválido";
                  ;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              ScopedModelDescendant<UserModel>(
                builder: (context, child, model) {
                  return SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                        child: Text(
                          "Criar Conta",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).secondaryHeaderColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            ClientData clientData = ClientData();

                            clientData.name = _nameController.text;
                            clientData.phone = _phoneController.text;
                            clientData.cpf = _cpfController.text;
                            clientData.sexo = _sexoController.text;
                            clientData.profession = _professionController.text;
                            clientData.uid = model.firebaseUser.uid;

                            ClientModel.of(context)
                                .addClient(clientData, _onSuccess);
                          }
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSuccess() {
    _scaffoldkey.currentState.showSnackBar(
      SnackBar(
          content: Text('Cliente criar o com sucesso!'),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 2)),
    );
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }
}
