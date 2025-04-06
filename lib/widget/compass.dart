import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class Compass extends StatefulWidget {
  const Compass({super.key});

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error reading heading',
              style: TextStyle(color: Colors.white));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(color: Colors.white);
        }

        double? direction = snapshot.data?.heading;
        if (direction == null) {
          return const Text("Device does not have sensors!",
              style: TextStyle(color: Colors.white));
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 5),
                    ],
                  ),
                  child: Transform.rotate(
                    angle: (direction * (math.pi / 180) * -1),
                    child: Image.asset(
                      'assets/images/compass.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                const Icon(Icons.navigation, size: 50, color: Colors.red),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "${direction.toStringAsFixed(2)}°",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ],
        );
      },
    );
  }
}
