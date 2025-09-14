import 'package:flutter/material.dart';
import 'package:men/core/helpers/logout_sheet.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            LogOutSheet.show(context);

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.logout_sharp),
              Text("Logout")
            ],
          ),
        )

      ],
    );
  }
}
