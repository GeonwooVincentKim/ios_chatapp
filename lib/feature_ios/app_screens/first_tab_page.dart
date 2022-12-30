import 'package:flutter/material.dart';

class FirstTabPage extends StatelessWidget {
  const FirstTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.amber,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(12.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            ListTile(
              title: const Text(
                'example',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ),
            const Text('Testing..')
          ],
        )
      )
    );
  }
}