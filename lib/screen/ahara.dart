import 'package:aurudu/widget/compass.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:aurudu/const/color.dart';
import 'package:flutter/material.dart';

class Ahara extends StatefulWidget {
  const Ahara({super.key});

  @override
  State<Ahara> createState() => _AharaState();
}

class _AharaState extends State<Ahara> {
  late Timer _timer;
  late DateTime fixedDateTime;
  late Duration remainingTime;

  @override
  void initState() {
    super.initState();
    fixedDateTime = DateTime(2025, 4, 14, 04, 04);
    remainingTime = fixedDateTime.difference(DateTime.now());

    // Start the timer only after remainingTime is set
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = fixedDateTime.difference(DateTime.now());
        if (remainingTime.isNegative) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Add a null check to avoid accessing remainingTime when it's not initialized.
    if (remainingTime.isNegative) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarBackgroundColor,
          elevation: 2,
          title: Row(
            children: [
              Image.asset(
                "assets/images/logo_2.png",
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 10),
              Text(
                "ආහර පිසීම",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                  fontFamily: "SinhalaFont",
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: const Center(
            child: Text(
              "ආහර පිසීම ආරම්භ වී ඇත.",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    int days = remainingTime.inDays;
    int hours = remainingTime.inHours % 24;
    int minutes = remainingTime.inMinutes % 60;
    int seconds = remainingTime.inSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarBackgroundColor,
        elevation: 2,
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo_2.png",
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text(
              "ආහර පිසීම",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
                fontFamily: "SinhalaFont",
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "ආහර පිසීම ආරම්භ වීමට ඉතිරි කාලය",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontFamily: "SinhalaFont",
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeContainer('$days', 'දින'),
              _buildTimeContainer('$hours', 'පැය'),
              _buildTimeContainer('$minutes', 'මිනිත්තු'),
              _buildTimeContainer('$seconds', 'තත්පර'),
            ],
          ),
          const SizedBox(height: 20),
          Compass(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              "අප්‍රේල් මස 14 වැනි සඳුදා පූර්වභාග 04-04 ට තඹ වර්ණ වස්ත්‍රාභරණයෙන් සැරසී දකුණු දිශාව බලා ළිප් බැඳ ගිනි මොළවා කිරිබතක්ද කැවිලි වර්ගයක්ද දී කිරි සහ විලඳ ද පිළියෙල කර ගැනීම මැනවි",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryColor,
                fontFamily: "SinhalaFont",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeContainer(String timeValue, String label) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            timeValue,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
