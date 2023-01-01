import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app.route.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text('Home '),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              print('I am pressed');
              Get.toNamed(AppRoutes.notifications);
            },
            child: const Text('Notifications'),
          )
        ],
      )),
    );
  }
}
