import 'package:flutter/material.dart';
import 'package:store_app/components/custom_button_component.dart';
import 'package:store_app/screen/login/components/login_footer.dart';
import 'package:store_app/screen/login/components/login_header.dart';
import 'package:store_app/screen/login/components/login_with.dart';
import 'package:store_app/screen/login/components/login_with_google.dart';
import 'package:store_app/screen/login/login_sreen.dart';
import 'package:store_app/theme/color_app.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginHeader(
                  label: "Create New Account",
                  subLabel:
                      "Looks like you dont have an account \n or connect with social networks",
                ),
                LoginUpTextField(),
                LoginWith(),
                CustomButtonComponent(
                  label: "Singup",
                  labelColor: AppColor.colorffffff,
                  onTap: () {},
                ),
                LoginWithGoogle(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: LoginFooter(
                    label: "Aldewady have on account?",
                    labelLink: "Login",
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginSreen(),
                          ),
                          (_) => false);
                    },
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

class LoginUpTextField extends StatelessWidget {
  const LoginUpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: 14, color: AppColor.color202020, fontWeight: FontWeight.w500);
    final Color iconColor = AppColor.color004CFF;
    final double sizedHeight = 15.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: "Name",
              prefixIcon: Icon(Icons.email, color: iconColor),
            ),
          ),
          SizedBox(height: sizedHeight),
          TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email, color: iconColor),
            ),
          ),
          SizedBox(height: sizedHeight),
          TextField(
            obscureText: true,
            style: textStyle,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, color: iconColor),
              suffixIcon: Icon(Icons.remove_red_eye_rounded, color: iconColor),
            ),
          ),
          SizedBox(height: sizedHeight),
          TextField(
            obscureText: true,
            style: textStyle,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              prefixIcon: Icon(Icons.lock, color: iconColor),
              suffixIcon: Icon(Icons.remove_red_eye_rounded, color: iconColor),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Forgot Password",
                style: TextStyle(fontSize: 12, color: AppColor.color004CFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
