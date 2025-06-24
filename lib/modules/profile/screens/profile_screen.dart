import 'package:flutter/material.dart';
import 'package:nge_store/modules/profile/providers/profile_provider.dart';
import 'package:nge_store/modules/profile/screens/widgets/account_widget.dart';
import 'package:nge_store/modules/profile/screens/widgets/activity_widget.dart';
import 'package:nge_store/modules/profile/screens/widgets/logout_widget.dart';
import 'package:nge_store/modules/profile/screens/widgets/support_widget.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            AccountWidget(),
            ActivityWidget(),
            v(1),
            SupportWidget(),
            v(1),
            LogoutWidget(),
          ],
        );
      },
    );
  }
}
