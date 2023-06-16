import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/dimensions.dart';
import '../../../../Utils/text_view.dart';
import '../../../Screens/login_page.dart';


class SettingListItem extends StatefulWidget {
  final itemData;

  SettingListItem({ required this.itemData});

  @override
  State<SettingListItem> createState() => _SettingListItemState();
}

class _SettingListItemState extends State<SettingListItem> {
  String userName = "";
  TextEditingController fbrTax = TextEditingController();
  TextEditingController praTax = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  showProfile() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Container(
          height: Dimensions.screenHeight(context),
          width: Dimensions.screenWidth(context),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Material(
              child: Container(
                height: 240,
                width: Dimensions.screenWidth(context) - 100,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: AppColors.grey, blurRadius: 4)
                ], color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: "Profile",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                   SizedBox(height: 20,),
                    TextView(
                      text: "Name : Zain",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    TextView(
                      text:
                          "Email : zain786@gmail.com",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: TextView(
                            text: "Ok",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // FirebaseAuth.instance
        //     .signInWithEmailAndPassword(email: 'newyou@domain.example', password: '123456'
        //        )
        //     .then((userCredential) {
        //   userCredential.user!.updateEmail("manager1@gmail.com");
        //   // userCredential.user!.updatePassword('newyou@domain.example');
        // });

        if (widget.itemData["title"] == "Profile") {
          showProfile();
        }  else {
          await FirebaseAuth.instance.signOut();
          Get.offAll(
            LoginPage(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 600),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 70,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey, blurRadius: 4, offset: Offset(0, 4))
            ]
            // border: Border.all(color: AppColors.black, width: 2),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.itemData["icon"],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextView(
              text: widget.itemData["title"],
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
