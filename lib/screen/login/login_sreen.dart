import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/components/custom_button_component.dart';
import 'package:store_app/screen/login/components/login_footer.dart';
import 'package:store_app/screen/login/components/login_header.dart';
import 'package:store_app/screen/login/components/login_with.dart';
import 'package:store_app/screen/login/components/login_with_google.dart';
import 'package:store_app/theme/color_app.dart';

class LoginSreen extends StatelessWidget {
  const LoginSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  log("Login");
                },
              ),
              LoginWith(),
              LoginWithGoogle(),
              Expanded(
                child: LoginFooter(
                  label: "First time here?",
                  labelLink: "SingUp",
                  onTap: () {
                    // TODO llama la pantalla de SingUp
                    log("SingUp");
                  },
                ),
              ),
            ],
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
                color: AppColor.colorffffff, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email, color: AppColor.colorffffff),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            obscureText: true,
            style: TextStyle(
                color: AppColor.colorffffff, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, color: AppColor.colorffffff),
              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                  color: AppColor.colorffffff),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Forgot Password",
                style: TextStyle(color: AppColor.color648286),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
