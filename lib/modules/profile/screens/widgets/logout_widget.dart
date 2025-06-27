import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nge_store/modules/profile/providers/profile_provider.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class LogoutWidget extends StatelessWidget {
  final ProfileProvider provider;
  const LogoutWidget(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () => provider.logout(context),
        child: Row(
          children: [
            Expanded(
              child: FaIcon(Icons.logout),
            ),
            Expanded(
              flex: 10,
              child: Text(
                "Logout",
                style: text(context).bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
