import 'package:flutter/material.dart';
import 'package:nge_store/modules/profile/providers/profile_provider.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class AccountWidget extends StatelessWidget {
  final ProfileProvider provider;
  const AccountWidget(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    final account = provider.account;
    return Container(
      color: Colors.purple,
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
                child: Image.network(
                  account.photo ?? "",
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
                    account.name ?? "",
                    style:
                        text(context).titleLarge!.copyWith(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      h(0.5),
                      Text(
                        account.email ?? "",
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
