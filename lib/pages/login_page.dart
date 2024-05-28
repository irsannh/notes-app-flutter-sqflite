import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/utils/user_shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController;
  late TextEditingController pinController;
  bool isPinExist = false;
  String? _pin;

  @override
  void initState() {
    nameController = TextEditingController();
    pinController = TextEditingController();
    String? pin = UserSharedPreferences.getPin();
    if (pin != null) {
      setState(() {
        isPinExist = true;
        _pin = pin;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Buku Catatan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const SizedBox(
              height: 80,
            ),
            Text('Nama',
            style: TextStyle(
              fontSize: 20
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.all(0)
                ),
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            const Text('PIN',
            style: TextStyle(
              fontSize: 20
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
              child: TextField(
                controller: pinController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    contentPadding: const EdgeInsets.all(0)
                ),
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(onPressed: () async {
              await UserSharedPreferences.setName(
                  name: nameController.text, 
                  pin: pinController.text,
              );
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                })
              );
            }, child: const Text('Masuk', style: TextStyle(
              fontSize: 20
            ),))
          ],
        ),
      ),
    );
  }
}
