import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Column(
            children: [
              const Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                    AssetImage("assets/avatar.webp"),
                  ),
                  SizedBox(width: 10,),
                  Text("Alan Dou",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [Text("MENU")],
                ),
              )
            ],
          ),
        )
    );
  }
}
