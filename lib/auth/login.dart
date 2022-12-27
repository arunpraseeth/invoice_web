import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_web/utils/constants.dart';

import '../utils/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(loginPlaceholder),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
            child: const VerticalDivider(
              thickness: 0.6,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.3,
                child: customTextField(
                  context: context,
                  hintText: "Email",
                  validator: (value) {
                    if (value!.length < 3) {
                      return "Kindly enter valid email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: heightPadding2),
              SizedBox(
                width: size.width * 0.3,
                child: customTextField(
                  context: context,
                  hintText: "Password",
                  validator: (value) {
                    if (value!.length < 3) {
                      return "Kindly enter valid password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: heightPadding2),
              Row(
                children: [
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: heightPadding2),
              ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onPressed: () async {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
