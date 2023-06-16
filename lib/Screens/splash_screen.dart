// // import 'package:flutter/material.dart';
// //
// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.greenAccent,
// //     );
// //   }
// // }
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
// import 'package:home_rental/Utils/screen.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   Screen size;
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 4), () {
//       navigateFromSplash();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
//     FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
//     FlutterStatusbarcolor.setStatusBarColor(Color(0xfff8f5f0));
//     size = Screen(MediaQuery.of(context).size);
//     return Scaffold(
//       body: ResponsiveContainer(
//         widthPercent: 100,
//         heightPercent: 100,
//         child: Container(
//           color: Color(0xfff8f5f0),    // white color
//           //color: Color(0xff1869d9),  // blue color
//           child: Image.asset(
//               'assets/city.gif'         // white gif
//             //'assets/gif/city_blue.gif'  // blue gif
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future navigateFromSplash () async {
//     String isOnBoard = await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);
//     String isLoggedIn = await LocalStorage.sharedInstance.loadAuthStatus(Constants.isLoggedIn);
//     if(isOnBoard ==null || isOnBoard == "0"){
//       //Navigate to OnBoarding Screen.
//       LocalStorage.sharedInstance.setAuthStatus(key:Constants.isLoggedIn,value: "false");
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
//     }else{
//       if(isLoggedIn==null || isLoggedIn=="false"){
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstScreen()));
//       }else{
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SearchPage()));
//       }
//     }
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(


          decoration: BoxDecoration(
        color: Colors.white
      ),
          alignment: Alignment.center,


          child: Image.asset("asset/images/logo2.png", )

        // child:FlutterLogo(size:MediaQuery.of(context).size.height)
      ),
    );

  }
}
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//           children:[
//             Positioned(right:130,top:60,child: Image.asset("assets/Group 127.png",)),
//             Positioned(right:60,top:220,child: Text("Enjoy Free Leads, Bid & ",style: TextStyle(fontSize: 25),)),
//             Positioned(right:145,top:250,child: Text("Win More Jobs ",style: TextStyle(fontSize: 25),)),
//             Positioned(right:40 ,bottom:230,child: Image.asset("assets/Group 934.png",)),
//             Positioned(left:0,bottom:2,child: Image.asset("assets/Group 125.png",)),
//             Positioned(bottom:100,top:650,right: 90,left: 100, child:ElevatedButton(onPressed: (){ },
//
//               style: ElevatedButton.styleFrom(
//                   primary: Color(0xffD664BE),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   )), child: Text("Get Started"),
//             ),
//
//             )
//           ]),
//     );
//   }
// }