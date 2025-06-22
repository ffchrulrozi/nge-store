import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Activity",
            style: text(context).titleMedium,
          ),
          v(1),
          Row(
            children: [
              ActivityBox(
                title: "My Favorite",
                icon: FontAwesomeIcons.heart,
                color: Colors.pink,
              ),
              h(1),
              ActivityBox(
                title: "Marked",
                icon: FontAwesomeIcons.bookmark,
                color: Colors.orange,
              )
            ],
          ),
          v(1),
          Row(
            children: [
              ActivityBox(
                title: "Last Seen",
                icon: FontAwesomeIcons.eye,
                color: Colors.green,
              ),
              h(1),
              ActivityBox(
                title: "Buy Again",
                icon: FontAwesomeIcons.cartArrowDown,
                color: Colors.blue,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ActivityBox extends StatelessWidget {
  const ActivityBox({
    required this.title,
    required this.icon,
    required this.color,
    super.key,
  });
  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: FaIcon(
                icon,
                color: color,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: text(context).bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
