import 'package:app02/modules/user.dart';
import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  final User user;

  const EditUserPage({super.key, required this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _nameController;
  late TextEditingController _genderController;
  late TextEditingController _photoUrlController;
  late TextEditingController _phoneNumberController;

  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _genderController = TextEditingController(text: widget.user.gender);
    _photoUrlController = TextEditingController(text: widget.user.photoUrl);
    _phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber);
  }

  void _updateUser(BuildContext context) {
    String name = _nameController.text;
    String gender = _genderController.text;
    String photoUrl = _photoUrlController.text;
    String phoneNumber = _phoneNumberController.text;

    User(
      name: name,
      gender: gender,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
    );

    // Atualizar o usuário na lista
    // Provider ou Mobx para isso

    Navigator.pop(context); // Voltar para tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Usuário'),
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
              decoration: const InputDecoration(labelText: 'Url da foto'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () => _updateUser(context),
              child: const Text('Atualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
