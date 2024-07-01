import 'package:flutter/material.dart';
import './home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'lib/img/logo.png',
                    height: 240,
                  )),
              const SizedBox(height: 40),
              const Text(
                'Let\'s shop',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 40),
              const Text(
                'Get yourself a brand new laptop',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 46),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  )
                ),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(25),
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
