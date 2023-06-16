import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homerentalapp/Screens/signup_page.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/btn.dart';
import '../../Utils/dimensions.dart';

import '../../Utils/spaces.dart';
import '../../Utils/text_edit_field.dart';
import '../../Utils/text_view.dart';
import '../../Utils/toast.dart';
import '../Utils/get_storage.dart';
import 'ForgotPasswordPage.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool emailvalidate = false;
  bool passvalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(text: "Sign In"),
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        height: Dimensions.screenHeight(context),
        width: Dimensions.screenWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddVerticalSpace(50),
              Container(
                // color: Colors.redAccent,
                child: ClipRRect(
                  child: Image.asset("asset/images/logo2.png",
                      height: 100, width: 100),
                ),
              ),
              AddVerticalSpace(30),
              TextEditField(
                hintText: "Email",
                cursorColor: AppColors.mainColor,
                textCapitalization: TextCapitalization.none,
                preffixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.mainColor,
                ),
                textEditingController: email,
                errorText: emailvalidate ? "Email Requried" : null,
                width: Dimensions.screenWidth(context),
              ),
              AddVerticalSpace(20),
              TextEditField(
                hintText: "Password",
                cursorColor: AppColors.mainColor,
                textCapitalization: TextCapitalization.none,
                preffixIcon:
                    Icon(Icons.lock_outline, color: AppColors.mainColor),
                textEditingController: password,
                width: Dimensions.screenWidth(context),
                errorText: passvalidate ? "Password Requried" : null,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: Text(
                    "ForgotPassword?",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              AddVerticalSpace(20),
              BTN(
                width: Dimensions.screenWidth(context) - 100,
                title: "Sign In",
                textColor: AppColors.white,
                color: AppColors.mainColor,
                fontSize: 15,
                onPressed: () async {
                  setState(() {
                    if (email.text.isEmpty) {
                      emailvalidate = true;
                    } else if (password.text.isEmpty) {
                      passvalidate = true;
                    } else {
                      emailvalidate = false;
                      passvalidate = false;
                    }
                  });
                  if (email.text.isNotEmpty && password.text.isNotEmpty) {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      )
                          .then((v) async {
                        var snap = await FirebaseFirestore.instance
                            .collection("UsersData")
                            .doc("${email.text}")
                            .get();
                        String name = (snap.data() as dynamic)["Name"];
                        GetStoreData.storeName(name: name);
                        GetStoreData.storeEmail(email: email.text);

                        Get.to(HomePage());
                      });
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      if (e.code == 'user-not-found') {
                        FlutterErrorToast(error: "Invalid Email");
                      } else if (e.code == 'wrong-password') {
                        FlutterErrorToast(error: "Invalid Password");
                      }

                      setState(() {
                        emailvalidate = false;
                        passvalidate = false;
                        // email.text = "";
                        // password.text = "";
                      });
                    }
                  }
                },
              ),
              AddVerticalSpace(20),
              Container(
                width: Dimensions.screenWidth(context),
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(text: "Don't have an account?"),
                    AddHorizontalSpace(5),
                    InkWell(
                      onTap: () {
                        Get.to(SignUpPage());
                      },
                      child: TextView(
                        text: "Sign Up",
                        color: AppColors.mainColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
