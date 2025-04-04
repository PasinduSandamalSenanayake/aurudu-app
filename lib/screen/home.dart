import 'package:aurudu/const/color.dart';
import 'package:flutter/material.dart';

import '../widget/event_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/logo_2.png",
                  height: 70,
                  width: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "සුබ අලුත් අවුරුද්දක් වේවා",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontFamily: "SinhalaFont"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            latestContainer(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "ඉදිරි කලාසටහන",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontFamily: "SinhalaFont"),
            ),
            const SizedBox(
              height: 10,
            ),
            const EventContainer(
              date: "අප්‍රේල්\n 13",
              title: "අලුත් අවුරුදු උදාව",
              description:
                  "අප්‍රේල් මස 14 වැනි සඳුදා \nදින පූර්වභාග 03.21 ට \nසිංහල අලුත් අවුරුද්ද උදාවෙයි",
              backgroundColor: Colors.green,
              primaryColor: Colors.black,
            ),
            const SizedBox(height: 10),
            const EventContainer(
              date: "අප්‍රේල්\n 13",
              title: "පුණ්‍ය කාලය",
              description:
                  "අප්‍රේල් මස 13 වැනි ඉරිදා\nඅපරභාග 08-57 සිට පසුදින\nඑනම් 14 වැනි සඳුදා පූර්වභාග\n09-45 දක්වා ",
              backgroundColor: Colors.orange,
              primaryColor: Colors.black,
            ),
            const SizedBox(height: 10),
            const EventContainer(
              date: "අප්‍රේල්\n 14",
              title: "ආහර පිසීම",
              description:
                  "අප්‍රේල් මස 14 වැනි සඳුදා\nපූර්වභාග 04-04 ට තඹ වර්ණ\nවස්ත්‍රාභරණයෙන් සැරසී දකුණු\nදිශාව බලා",
              backgroundColor: Colors.blue,
              primaryColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget latestContainer() {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "පරණ අවුරුද්ද සඳහා ස්නානය",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontFamily: "SinhalaFont"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "අප්‍රේල් මස 13 වැනි ඉරිදා දින දිවුල්පත් යුෂ මිශ්‍ර නානු ගා ස්නානය කොට ඉෂ්ට දේවතා අනුස්මරණයෙහි යෙදී වාසය මැනවි",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: primaryColor,
                  fontFamily: "SinhalaFont"),
            )
          ],
        ),
      ),
    );
  }
}
