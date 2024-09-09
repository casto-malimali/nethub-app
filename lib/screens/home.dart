import 'package:flutter/material.dart';

import 'auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 30, 0, 0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('path/to/your/avatar.png'),
              ),
            ),

            // Description title and subheading
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getGreeting(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Welcome to the official data collection app',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            // Container with chicken icon
            Container(
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200], // Replace with your desired color
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Show empty container from bottom when tapped
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            color: const Color.fromARGB(255, 191, 219, 241),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    child: ListTile(
                                      title:
                                          const Text('Add Chicken House Data'),
                                      leading: const Icon(
                                        Icons.add,
                                        color: Color.fromARGB(255, 2, 75, 170),
                                      ),
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          // ignore: prefer_const_constructors
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AuthScreen()),
                                        )
                                      },
                                    ),
                                  ),
                                  const Card(
                                    child: ListTile(
                                      title: Text('Click to Consult'),
                                      leading: Icon(Icons.remove_red_eye,
                                          color:
                                              Color.fromARGB(255, 2, 75, 170)),
                                    ),
                                  ),
                                ]),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.pets, // Replace with your desired icon
                        size: 50,
                        color: Colors.orange,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getGreeting() {
    final now = DateTime.now();
    if (now.hour < 12) {
      return 'Good morning';
    } else if (now.hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }
}
