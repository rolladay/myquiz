import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    required this.switchScreen,
    super.key,
  });

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Image.asset(
            color: const Color.fromARGB(100, 255, 255, 255),
            'assets/images/quiz-logo.png',
            width: 300.0,
          ),
          const SizedBox(
            height: 50.0,
          ),
          const Text(
            'Learn Flutter the Fun Way!',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: OutlinedButton.icon(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                switchScreen();
              },
              label: const Text(
                'Start Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
