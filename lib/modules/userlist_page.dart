import 'package:app02/modules/add_user_page.dart';
import 'package:app02/modules/edit_user_page.dart';
import 'package:app02/modules/user.dart';
import 'package:app02/modules/user_detail_page.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final List<User> _users = [
    User(
      name: 'Jhonatan',
      gender: 'Masculino',
      photoUrl:
          'https://img.freepik.com/fotos-premium/um-grande-jacare-cruzando-na-grama_17389-751.jpg',
      phoneNumber: '0000-0000',
    ),
    User(
      name: 'Thais',
      gender: 'Feminino',
      photoUrl:
          'https://img.freepik.com/fotos-premium/um-grande-jacare-cruzando-na-grama_17389-751.jpg',
      phoneNumber: '1111-1111',
    ),
  ];

  void _navigateToUserDetail(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailPage(user: user),
      ),
    );
  }

  void _navigateToAddUser() async {
    final newUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddUserPage(),
      ),
    );
    if (newUser != null) {
      setState(() {
        _users.add(newUser);
      });
    }
  }

  void _navigateToEditUser(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserPage(user: user),
      ),
    ).then((updatedUser) {
      if (updatedUser != null) {
        setState(() {
          int index = _users.indexOf(user);
          _users[index] = updatedUser;
        });
      }
    });
  }

  void _deleteUser(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Usuário'),
          content: Text('Deseja excluir o usuário ${user.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _users.remove(user);
                });
                Navigator.pop(context);
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Usuários'),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.deepOrange.withOpacity(0.9),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          User user = _users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_users[index].photoUrl),
            ),
            title: Text(_users[index].name),
            subtitle: Text(_users[index].gender),
            onTap: () {
              // abrir tela  de detalhes de usuário
              _navigateToUserDetail(user);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    _navigateToEditUser(user);
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    _deleteUser(user);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Abrir tela de adicionar usuário
          _navigateToAddUser();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
