import 'package:app02/pages/user.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _photoUrlController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  void _saveUser(BuildContext context) {
    String name = _nameController.text;
    String gender = _genderController.text;
    String photoUrl = _photoUrlController.text;
    String phoneNumber = _phoneNumberController.text;

    User newUser = User(
        name: name,
        gender: gender,
        photoUrl: photoUrl,
        phoneNumber: phoneNumber);

    //Adicionar o novo usuário a lista
    //Pode-se usar um serviço de gerenciamento  de estado , como Provider.

    Navigator.pop(context); // Voltar para tela anterior.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Usuário'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _genderController,
              decoration: const InputDecoration(labelText: 'Sexo'),
            ),
            TextField(
              controller: _photoUrlController,
              decoration: const InputDecoration(labelText: 'URL da foto'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                _saveUser(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
