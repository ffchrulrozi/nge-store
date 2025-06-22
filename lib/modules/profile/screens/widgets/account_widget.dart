import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nge_store/assets/assets.gen.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(children: [
            Spacer(),
            Icon(Icons.settings, color: Colors.white),
            h(1),
            Icon(Icons.chat, color: Colors.white),
            h(1),
          ]),
          v(1),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  Assets.lib.assets.img.me.path,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              h(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Uciha Itachi",
                    style:
                        text(context).titleLarge!.copyWith(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                      h(0.5),
                      Text(
                        "Ternate, North Moluccu",
                        style: text(context)
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
