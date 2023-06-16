import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../SettingModule/Views/Components/setting_list_item.dart';
import '../../SettingModule/Views/setting_view.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/btn.dart';
import '../../Utils/dimensions.dart';
import '../../Utils/get_storage.dart';
import '../HomePage.dart';
import '../login_page.dart';
import '../user_updatescreen.dart';



class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColors.mainColor),
            accountName: Text("${GetStoreData.getName()}"),
            accountEmail: Text("${GetStoreData.getEmail()}"),
              currentAccountPicture:SizedBox(),
          ),
          ListTile(
            leading: Icon(Icons.update), title: Text("Update"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => UserProfile()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings), title: Text("Settings"),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.settings), title: Text("Settings"),
            onTap: () {
              Get.to(SettingView());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout), title: Text("Logout"),
            onTap: ()async{
              await FirebaseAuth.instance.signOut().then((value) =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage())));
              // if(FirebaseAuth.instance.currentUser == null&&GetStoreData.getEmail()==null) {
              //   Get.to(SignInView());
              //}
            },
          ),
          SizedBox(height: 30,),
          // AddVerticalSpace(30),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: BTN(
              width: Dimensions.screenWidth(context) - 100,
              title: "Back to Home",
              textColor: AppColors.white,
              color: AppColors.mainColor,
              fontSize: 15, onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            ),
          ),
        ],
      ),
    );
  }
}


