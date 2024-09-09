import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        // ignore: prefer_const_constructors
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(); // Go back to the previous screen
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Welcome to MKBS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Enter code to input data for Chicken house'),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Continue'),
                ),
              ),
            ),
            ListTile(
              title: Text('Today Uploaded Data'),
            )
          ],
        ),
      ),
    );
  }
}
