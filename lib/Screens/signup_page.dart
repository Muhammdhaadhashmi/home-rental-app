import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/btn.dart';
import '../../../Utils/dimensions.dart';
import '../../../Utils/spaces.dart';
import '../../../Utils/text_edit_field.dart';
import '../../../Utils/text_view.dart';
import '../Utils/get_storage.dart';
import '../Utils/toast.dart';
import 'HomePage.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  bool firstnamevalidate = false;
  bool lastnamevalidate = false;
  bool emailvalidate = false;
  bool imgvalidate = false;

  bool expvalidate = false;
  bool phonevalidate = false;
  bool skilllvalidate = false;
  bool passvalidate = false;
  bool passValid = false;
  bool emailValid = false;
  final email = TextEditingController();
  final username = TextEditingController();
  final lastname = TextEditingController();

  bool confirmvalidate = false;
  bool heightvalidate = false;
  bool weightvalidate = false;
  final TextEditingController confirmpassword = new TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

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
      if (value != null){
        setState(() {
          imageURL = value;
          updateAble = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(text: "Create Account"),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: Dimensions.screenHeight(context),
        width: Dimensions.screenWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: isLoading
            ? Center(
                child: SpinKitThreeBounce(
                  color: AppColors.mainColor,
                  size: MediaQuery.of(context).size.width / 8,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddVerticalSpace(50),
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
                              errorWidget: (context, url, error) {
                                return Icon(
                                  Icons.error,
                                  color: AppColors.white,
                                );
                              },
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
                    AddVerticalSpace(20),
                    TextEditField(
                      hintText: "UserName",
                      cursorColor: AppColors.mainColor,
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(Icons.person_outline_outlined,
                          color: AppColors.mainColor),
                      textEditingController: username,
                      errorText:
                          firstnamevalidate ? "Firstname Requried" : null,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(20),
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
                      inputType: TextInputType.phone,
                      hintText: "PhoneNo",
                      maxLength: 11,
                      cursorColor: AppColors.mainColor,
                      textCapitalization: TextCapitalization.none,
                      preffixIcon:
                          Icon(Icons.phone, color: AppColors.mainColor),
                      textEditingController: phone,
                      errorText: phonevalidate ? "Phone Requried" : null,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(20),

                    TextEditField(
                      hintText: "Password",
                      cursorColor: AppColors.mainColor,
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(Icons.lock, color: AppColors.mainColor),
                      textEditingController: password,
                      errorText: passvalidate ? "Password Requried" : null,
                      width: Dimensions.screenWidth(context),
                      isPassword: true,
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    // AddVerticalSpace(7),
                    TextEditField(
                      hintText: "Confirm Password",
                      cursorColor: AppColors.mainColor,
                      textCapitalization: TextCapitalization.none,
                      preffixIcon: Icon(Icons.lock, color: AppColors.mainColor),
                      textEditingController: confirmpassword,
                      errorText:
                          confirmvalidate ? "confirmpassword Requried" : null,
                      width: Dimensions.screenWidth(context),
                      isPassword: true,
                    ),
                    AddVerticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddHorizontalSpace(20),
                        Checkbox(
                          activeColor: AppColors.mainColor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        TextView(
                          text: "I accept all the Terms & Conditions",
                        ),
                        // AddHorizontalSpace(20)
                      ],
                    ),
                    AddVerticalSpace(10),
                    BTN(
                      width: Dimensions.screenWidth(context) - 100,
                      title: "Sign Up",
                      textColor: AppColors.white,
                      color: AppColors.mainColor,
                      fontSize: 15,
                      onPressed: () async {
                        if (username.text.isEmpty) {
                          setState(() {
                            firstnamevalidate = true;
                          });
                        }

                        else if (email.text.isEmpty) {
                          setState(() {
                            emailvalidate = true;
                          });
                        } else if (phone.text.length != 11) {
                          Fluttertoast.showToast(
                              msg: 'Mobile Number must be of 11 digit',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.mainColor,
                              textColor: Colors.white,
                              fontSize: 10.0);
                          setState(() {
                            phonevalidate = true;
                          });
                          // return 'Mobile Number must be of 11 digit';
                        } else if (password.text.isEmpty) {
                          setState(() {
                            passvalidate = true;
                          });
                        } else if (confirmpassword.text.isEmpty) {
                          setState(() {
                            confirmvalidate = true;
                          });

                        } else if (imageURL.isEmpty) {
                          setState(() {
                            imgvalidate = true;
                          });
                        } else if (isChecked == false) {
                          FlutterSimpleToast(
                              msg: "Agree to Terms & Conditions");
                        } else {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            )
                                .then((value) async {
                              // Get.to(gender_selection());
                            });
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              FlutterErrorToast(
                                error: 'The password provided is too weak.',
                              );
                            } else if (e.code == 'email-already-in-use') {
                              FlutterErrorToast(
                                  error:
                                      "The account already exists for this email.");
                            };
                          }
                          await FirebaseFirestore.instance
                              .collection("UsersData")
                              .doc(email.text)
                              .set({
                            "Name": username.text,
                            "Email": email.text,
                            "PhoneNumber": phone.text,
                            "Password": password.text,
                            "ConfirmPassword": confirmpassword.text,
                            "userImage": imageURL,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                      // email: email.text,
                                      )));
                        }
                        print("Email is $email");

                        GetStoreData.storeName(name: username.text);
                        GetStoreData.storeEmail(email: email.text);
                      },
                    ),
                    AddVerticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView(text: "Already have an account?"),
                        AddHorizontalSpace(5),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                            // Get.back();
                          },
                          child: TextView(
                            text: "Sign In",
                            color: AppColors.mainColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    AddVerticalSpace(20),
                  ],
                ),
              ),
      ),
    );
  }
}
