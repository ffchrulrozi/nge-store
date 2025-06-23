import 'package:flutter/material.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "Ipsum amet eiusmod sunt irure quis irure incididunt esse sunt officia. Veniam anim Lorem voluptate et veniam dolor.",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
