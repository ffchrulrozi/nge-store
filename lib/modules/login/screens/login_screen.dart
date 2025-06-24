import 'package:flutter/material.dart';
import 'package:nge_store/assets/assets.gen.dart';
import 'package:nge_store/modules/login/providers/login_provider.dart';
import 'package:nge_store/utils/ext/size_ext.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
        builder: (BuildContext context, LoginProvider provider, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 50,
                    color: Colors.purple,
                  ),
                  Text(
                    "Nge Shop",
                    style: text(context).headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Shop Here,",
                        style: text(context)
                            .bodyLarge!
                            .copyWith(color: Colors.teal),
                      ),
                      h(1),
                      Text(
                        "Shop Now!",
                        style: text(context)
                            .bodyLarge!
                            .copyWith(color: Colors.indigo),
                      ),
                    ],
                  ),
                  v(10),
                  InkWell(
                    onTap: () => provider.login(context),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.lib.assets.img.google.path,
                            width: 40,
                            height: 40,
                          ),
                          h(1),
                          Text("Login with Google")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 25,
              child: SizedBox(
                width: 100.w(context),
                child: Text(
                  "App version 1.0.0",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (provider.isLoading)
              AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Color.fromARGB(100, 0, 0, 0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
