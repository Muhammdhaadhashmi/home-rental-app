import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Utils/app_colors.dart';
import '../Utils/btn.dart';
import '../Utils/dimensions.dart';
import '../Utils/spaces.dart';
import '../Utils/text_edit_field.dart';
import '../Utils/text_view.dart';
import 'HomePage.dart';


class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  bool isChecked = false;
  bool namevalidate = false;
  bool emailvalidate = false;
  bool imgvalidate = false;
  bool expvalidate = false;
  bool phonevalidate = false;
  bool skilllvalidate = false;
  bool passvalidate = false;
  bool passValid = false;

  bool priceValid = false;
  bool emailValid = false;
  final phone = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  bool agevalidate = false;
  bool heightvalidate = false;
  bool weightvalidate = false;

  bool isLoading = false;
  String imageURL = "";
  var encodedImage;
  bool updateAble = false;
  final ImagePicker _picker = ImagePicker();



  Future<void> openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      encodedImage = File(photo!.path);
    });
    if (photo != null) {
      storeUserImage();
    } else {
      print('No Image Path Received');
    }
  }

  Future<void> openGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      encodedImage = File(photo!.path);
    });

    if (photo != null) {
      storeUserImage();
    } else {
      print('No Image Path Received');
    }
  }

  storeUserImage() async {
    imageURL = "";
    final firebaseStorage = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = firebaseStorage.putFile(encodedImage);
    TaskSnapshot taskSnapshot = await uploadTask;

    await taskSnapshot.ref.getDownloadURL().then((value) async {
      if (value != null) {
        setState(() {
          imageURL = value;
          updateAble = true;
        });
      }
    });


  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    await FirebaseFirestore.instance
        .collection("UsersData")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      setState(() {
        name.text = (value.data() as dynamic)["Name"] ?? "";
        phone.text = (value.data() as dynamic)["PhoneNumber"] ?? "";
        email.text = (value.data() as dynamic)["Email"] ?? "";
        password.text = (value.data() as dynamic)["Password"] ?? "";
        imageURL = (value.data() as dynamic)["userImage"] ?? "";
      });
    });
  }

  updatedata() async {
      var data = {
        "Name": name.text,
        "PhoneNumber": phone.text,
        "Password":password.text,
        "userImage": imageURL,
      };
      // setState(() {
      //   weightvalidate=true;
      //
      // });
      await FirebaseFirestore.instance
          .collection("UsersData")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .update(data);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            // alignment: Alignment.topRight,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          title: TextView(text: "Profile Screen"),
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder<Object>(builder: (context, snapshot) {
          return SafeArea(
            minimum: const EdgeInsets.only(top: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    AddVerticalSpace(30),
                    Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              shape: BoxShape.circle),
                          padding: EdgeInsets.all(5),
                          child: ClipOval(
                            // borderRadius: BorderRadius.circular(100),
                            child: OptimizedCacheImage(
                              imageUrl: imageURL,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Container(
                                height: 30,
                                width: 30,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: AppColors.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: AppColors.white,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.white,
                            ),
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  backgroundColor: AppColors.transparent,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 130,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          BTN(
                                            width:
                                            Dimensions.screenWidth(context),
                                            title: "Camera",
                                            color: AppColors.white,
                                            onPressed: () async {
                                              var status = await Permission
                                                  .camera.status;

                                              if (status.isGranted) {
                                                openCamera();
                                                Navigator.pop(context);
                                              } else {
                                                await Permission.camera
                                                    .request();
                                              }
                                            },
                                          ),
                                          BTN(
                                            width:
                                            Dimensions.screenWidth(context),
                                            title: "Gallery",
                                            color: AppColors.white,
                                            onPressed: () async {
                                              var status = await Permission
                                                  .storage.status;

                                              if (status.isGranted) {
                                                openGallery();
                                                Navigator.pop(context);
                                              } else {
                                                await Permission.storage
                                                    .request();
                                              }
                                            },
                                          ),
                                          AddVerticalSpace(5),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.camera_alt,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AddVerticalSpace(50),
                    Center(
                      child: Text(
                        "Update Profile",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    AddVerticalSpace(50),
                    TextEditField(
                      cursorColor: AppColors.mainColor,
                      hintText: "Username",
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(Icons.person_outline_outlined,
                        color: AppColors.mainColor,),
                      textEditingController: name,
                      errorText: namevalidate ? "Username Requried" : null,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(20),
                    TextEditField(
                      cursorColor: AppColors.mainColor,
                      hintText: "Email",
                      readOnly: true,
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(
                        Icons.email_outlined, color: AppColors.mainColor,),
                      textEditingController: email,
                      errorText: emailvalidate ? "Email Requried" : null,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(20),
                    TextEditField(
                      cursorColor: AppColors.mainColor,
                      inputType: TextInputType.phone,
                      hintText: "PhoneNo",
                      maxLength: 11,
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(
                        Icons.phone, color: AppColors.mainColor,),
                      textEditingController: phone,
                      errorText: phonevalidate ? "Phone Requried" : null,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(20),
                    TextEditField(
                      cursorColor: AppColors.mainColor,
                      hintText: "Password",
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(
                        Icons.lock_outline, color: AppColors.mainColor,),
                      textEditingController: password,
                      errorText: passvalidate ? "Password Requried" : null,
                      width: Dimensions.screenWidth(context),
                      isPassword: true,
                    ),
                    AddVerticalSpace(25),
                    BTN(
                        width: Dimensions.screenWidth(context) - 100,
                        title: "Update Data",
                        textColor: AppColors.white,
                        color: AppColors.mainColor,
                        fontSize: 15,
                        onPressed: () {
                          if (name.text.isEmpty) {
                            setState(() {
                              namevalidate = true;
                            });
                          } else if (email.text.isEmpty) {
                            setState(() {
                              emailvalidate = true;
                            });
                          }
                          else if (phone.text.length!=11) {
                            Fluttertoast.showToast(
                                msg: 'Mobile Number must be of 11 digit',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColors.mainColor,
                                textColor: Colors.white,
                                fontSize: 10.0);
                            setState(() {
                              phonevalidate=true;
                            });
                            // return 'Mobile Number must be of 11 digit';
                          } else if (password.text.isEmpty) {
                            setState(() {
                              passvalidate = true;
                            });
                          }
                          else if (imageURL.isEmpty) {
                            setState(() {
                              imgvalidate = true;
                            });
                          }
                          updatedata();
                          Fluttertoast.showToast(
                              msg: ' Your Data is Updated',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.mainColor,
                              textColor: Colors.white,
                              fontSize: 10.0);

                        }
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       ElevatedButton(
                    //         onPressed: () {
                    //           Navigator.of(context).push(MaterialPageRoute(
                    //               builder: (context) => drawer()));
                    //
                    //           // Navigator.of(context).pop();
                    //         },
                    //         child: const Text('Back'),
                    //       ),
                    //       ElevatedButton(
                    //         onPressed: () {
                    //           Navigator.pushReplacement(context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => LoginPage())
                    //           );
                    //           // TODO: Implement logout functionality
                    //
                    //         },
                    //         child: const Text('Logout'),
                    //       ),
                    //     ],
                    //   ),
                    //
                    // ),
                  ],
                ),
              ),
            ),
          );
        }
        )
    );
  }
}