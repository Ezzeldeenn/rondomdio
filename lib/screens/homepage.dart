import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider providerObject = UserProvider.getObject(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Trigger data fetch if list is empty and not loading
          if (userProvider.userData?.result == null) {
            providerObject.fetchUsers();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: userProvider.userData?.result.length ?? 0,
              itemBuilder: (context, index) {
                final user = userProvider.userData!.result[index];
                return userItem(
                  name: user["name"],
                  email: user["email"],
                  image: user["image"],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerObject.fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget userItem({
    required String name,
    required String email,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(email),
            ],
          ),
        ],
      ),
    );
  }
}
