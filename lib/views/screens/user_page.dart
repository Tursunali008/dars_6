import 'package:dars6/controllers/user_controller.dart';
import 'package:dars6/models/user.dart';
import 'package:dars6/views/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserController userController = UserController();

  @override
  void initState() {
    super.initState();
    userController.getInfo(); // Initialize user list on start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Page')),
      body: FutureBuilder<List<UserModel>>(
        future: userController.getInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No users available'),
            );
          }

          final users = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UserWidget(users[index]);
            },
          );
        },
      ),
    );
  }
}
