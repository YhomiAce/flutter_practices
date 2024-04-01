import 'package:boxed_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoHomePage extends StatelessWidget {
  const GoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: () {
              final User user = User(
                "Denzel Washighton",
                "Actor",
                "https://static1.moviewebimages.com/wordpress/wp-content/uploads/2023/08/denzel-washington-in-the-equalizer-3-1.jpg",
              );
              context.pushNamed("/profile", extra: user);
            },
            color: Colors.purple,
            child: const Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: () {
              context.pushNamed('/pricing', pathParameters: {"price": "99.99"});
            },
            color: Colors.green,
            child: const Text(
              "Pricing",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
