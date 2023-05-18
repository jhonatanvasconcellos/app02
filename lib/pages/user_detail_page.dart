import 'package:app02/pages/user.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Usuário'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Image.network(user.photoUrl),
          ListTile(
            title: const Text('Nome'),
            subtitle: Text(user.name),
          ),
          ListTile(
            title: const Text('Sexo'),
            subtitle: Text(user.gender),
          ),
          ListTile(
            title: const Text('Telefone'),
            subtitle: Text(user.phoneNumber),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Abrir tela de edição do usuário
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
