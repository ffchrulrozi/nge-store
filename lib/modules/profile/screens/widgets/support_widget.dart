import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class SupportWidget extends StatelessWidget {
  const SupportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Support",
            style: text(context).titleMedium,
          ),
          v(1),
          SupportBox(
            title: "Support Center",
            icon: FontAwesomeIcons.link,
          ),
          SupportBox(
            title: "Frequently Questions",
            icon: FontAwesomeIcons.chartSimple,
          ),
          SupportBox(
            title: "Chat with Customer Service",
            icon: FontAwesomeIcons.faceSmile,
          ),
        ],
      ),
    );
  }
}

class SupportBox extends StatelessWidget {
  const SupportBox({
    required this.title,
    required this.icon,
    super.key,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: FaIcon(icon),
          ),
          Expanded(
            flex: 10,
            child: Text(
              title,
              style: text(context).bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
