import 'package:flutter/material.dart';

class DrawerProfileHeader extends StatelessWidget {
  const DrawerProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      color: Colors.white,
      elevation: 5,
      child: Container(
        height: 125,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.7, -0.6),
            radius: 2,
            colors: [
              Color.fromARGB(255, 210, 210, 210),
              Color.fromARGB(255, 205, 205, 205),
              Color.fromARGB(255, 250, 250, 250),
              Colors.white,
            ],
            stops: [0.3, 0.3, 0.6, 0.6],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/avatar.webp"),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Alan Dou",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    )),
                Text(
                  "2500 PTS",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
