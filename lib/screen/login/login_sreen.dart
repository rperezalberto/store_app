import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/components/custom_button_component.dart';
import 'package:store_app/screen/login/components/login_footer.dart';
import 'package:store_app/screen/login/components/login_header.dart';
import 'package:store_app/screen/login/components/login_with.dart';
import 'package:store_app/screen/login/components/login_with_google.dart';
import 'package:store_app/screen/login/singup_screen.dart';
import 'package:store_app/screen/main/main_app_home.dart';
import 'package:store_app/theme/color_app.dart';

class LoginSreen extends StatelessWidget {
  const LoginSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeader(
                  label: "Welcome back.",
                  subLabel:
                      "Log in to your account using email \n or saocial networks.",
                ),
                // Input del login
                LoginTextField(),
                CustomButtonComponent(
                  label: "Login",
                  labelColor: AppColor.colorffffff,
                  onTap: () {
                    // TODO Login
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MainAppHome()));
                  },
                ),
                LoginWith(),
                LoginWithGoogle(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: LoginFooter(
                      label: "First time here?",
                      labelLink: "SingUp",
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingupScreen(),
                            ),
                            (_) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          TextField(
            style: TextStyle(
                fontSize: 14,
                color: AppColor.color202020,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email, color: AppColor.color004CFF),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            obscureText: true,
            style: TextStyle(
                fontSize: 14,
                color: AppColor.color202020,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, color: AppColor.color004CFF),
              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                  color: AppColor.color004CFF),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor.color004CFF,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
