import 'package:app02/modules/userlist_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const UserRegistrationApp());
}

class UserRegistrationApp extends StatelessWidget {
  const UserRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Usuários',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: const UserListPage(),
    );
  }
}
