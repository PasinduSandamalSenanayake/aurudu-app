import 'package:flutter/material.dart';
import 'package:aurudu/widget/compass.dart';
import 'dart:async';

import 'package:aurudu/const/color.dart';

class WedaAllima extends StatefulWidget {
  const WedaAllima({super.key});

  @override
  State<WedaAllima> createState() => _WedaAllimaState();
}

class _WedaAllimaState extends State<WedaAllima> {
  late Timer _timer;
  late DateTime fixedDateTime;
  late Duration remainingTime;

  @override
  void initState() {
    super.initState();
    fixedDateTime = DateTime(2025, 4, 14, 06, 44);
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
                "වැඩ ඇල්ලීම-ගනුදෙනු කිරීම-ආහාර අනුභවය",
                style: TextStyle(
                  fontSize: 14,
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
              "වැඩ ඇල්ලීම-ගනුදෙනු කිරීම-ආහාර අනුභවය ආරම්භ වී ඇත.",
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
              "වැඩ ඇල්ලීම-ගනුදෙනු \nකිරීම-ආහාර අනුභවය",
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                "වැඩ ඇල්ලීම-ගනුදෙනු කිරීම-ආහාර අනුභවය ආරම්භ වීමට ඉතිරි කාලය",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontFamily: "SinhalaFont",
                ),
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
                "අප්‍රේල් මස 14 වැනි සඳුදා පූර්වභාග 06-44 ට මුතු හා ශ්වේත වර්ණ වස්ත්‍රාභරණයෙන් සැරසී දකුණු දිශාව බලා සියලු වැඩ අල්ලා ගනුදෙනු කොට ආහාර අනුභව කිරීම මැනවි",
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
