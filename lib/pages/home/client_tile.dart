import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_clients_firebase/data/client_data.dart';

class ClientTile extends StatelessWidget {
  ClientData clientData;

  ClientTile(this.clientData);

  @override
  Widget _buildContent() {
    return ListTile(
      leading: CircleAvatar(
        child: Text(clientData.name.toUpperCase()[0]),
      ),
      title: Text(clientData.name),
      subtitle: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Telefone: '),
                  Text(clientData.phone),
                ],
              ),
              Row(
                children: [
                  Text('CPF: '),
                  Text(clientData.phone),
                ],
              ),
            ],
          ),
          // SizedBox(
          //   width: 12,
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       children: [
          //         Text('Sexo: '),
          //         Text(clientData.sexo),
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Text('Profissão: '),
          //         Text(clientData.profession),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: clientData == null
          ? FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection('users')
                  .document(clientData.uid)
                  .collection('clients')
                  .document(clientData.id)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  clientData = ClientData.fromDocument(snapshot.data);
                  return _buildContent();
                } else {
                  return Container(
                    height: 70.0,
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                }
              },
            )
          : _buildContent(),
    );
  }
}
