import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/btn.dart';
import '../../Screens/Templates/BookedPage.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/dimensions.dart';
import '../../Utils/spaces.dart';
import '../../Utils/text_edit_field.dart';
import '../../Utils/text_view.dart';
import '../../Utils/toast.dart';
import '../Models/entry_model.dart';
import '../ViewModels/entry_view_model.dart';

class AddEnteryView extends StatefulWidget {
  const AddEnteryView({Key? key}) : super(key: key);

  @override
  State<AddEnteryView> createState() => _AddEnteryViewState();
}

class _AddEnteryViewState extends State<AddEnteryView> {

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController Cnic = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController rooms = TextEditingController();
  TextEditingController bedrooms = TextEditingController();
  TextEditingController bathrooms = TextEditingController();


  TextEditingController amount = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController totalAmount = TextEditingController();
  TextEditingController Advance = TextEditingController();
  TextEditingController Remaining = TextEditingController();
  TextEditingController description = TextEditingController();



  bool personNameValid = false;
  bool personNumberValid = false;
  bool personCNICValid = false;
  bool personAddressValid = false;
  bool descriptionValid = false;

  bool roomsValid = false;
  bool bedroomsValid = false;
  bool bathroomsValid = false;


  bool amountValid = false;
  bool discountValid = false;

  bool totalAmountValid = false;
  bool remainValid = false;
  bool AdvanceValid = false;

  bool loading = false;



  EntryViewModel entryViewModel = Get.put(EntryViewModel());

  @override
  void initState() {
    super.initState();
    entryViewModel.getEntryonDate();
  }

  List list = [];


  @override
  Widget build(BuildContext context) {
    double blur = loading ? 5 : 0;
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.blue,
              title: TextView(text: "Add Entery"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddVerticalSpace(20),
                    TextView(text: "Name"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Person Name",
                      textEditingController: name,
                      hintcolor:
                      personNameValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                      onTap: () {
                      },
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Person Mobile Number"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Person Mobile Number",
                      inputType: TextInputType.number,
                      textEditingController: number,
                      hintcolor:
                      personNumberValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Person CNIC"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Person CNIC",
                      textEditingController: Cnic,
                      inputType: TextInputType.number,
                      hintcolor:
                          personCNICValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Person Address"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Person Address",
                      textEditingController: Address,
                      hintcolor:
                          personAddressValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Total Rooms"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Rooms",
                      textEditingController: rooms,
                      hintcolor:
                      roomsValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Bed Rooms"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Bed Rooms",
                      textEditingController: bedrooms,
                      hintcolor:
                      bedroomsValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Bath Rooms"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Bath rooms",
                      textEditingController: bathrooms,
                      hintcolor:
                      bathroomsValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Amount"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Amount",
                      textEditingController: amount,
                      inputType: TextInputType.number,
                      hintcolor: amountValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Discount"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Discount",
                      textEditingController: discount,
                      inputType: TextInputType.number,
                      hintcolor: discountValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Total Amount"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Total Amount",
                      textEditingController: totalAmount,
                      inputType: TextInputType.number,
                      hintcolor:
                          totalAmountValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Advance"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Advance",
                      textEditingController: Advance,
                      inputType: TextInputType.number,
                      hintcolor:  AdvanceValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Ramaining"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Ramaining",
                      textEditingController: Remaining,
                      inputType: TextInputType.number,
                      hintcolor: AdvanceValid ? AppColors.red : AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(11),
                    TextView(text: "Description"),
                    AddVerticalSpace(5),
                    TextEditField(
                      hintText: "Description",
                      textEditingController: description,
                      inputType: TextInputType.text,
                      hintcolor: AppColors.grey,
                      width: Dimensions.screenWidth(context),
                    ),
                    AddVerticalSpace(16),
                    TextView(text: "Images"),
                    AddVerticalSpace(5),
                    Obx(
                      () => entryViewModel.images.value.length == 0
                          ? Center(
                              child: GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                                  );

                                  if (result != null) {
                                    entryViewModel.images.value = result.paths
                                        .map((path) => File(path!))
                                        .toList();

                                    print(entryViewModel.images.value);
                                  } else {
                                    // User canceled the picker
                                    FlutterSimpleToast(
                                        msg: "Please Select images");
                                  }
                                },
                                child: Container(
                                  height: 100,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.grey,
                                            blurRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "asset/images/picture.png"))),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      allowMultiple: true,
                                      type: FileType.custom,
                                      allowedExtensions: ['jpg', 'jpeg', 'png'],
                                    );

                                    if (result != null) {
                                      entryViewModel.images.value = result.paths
                                          .map((path) => File(path!))
                                          .toList();

                                      print(entryViewModel.images.value);
                                    } else {
                                      // User canceled the picker
                                      FlutterSimpleToast(
                                          msg: "Please Select images");
                                    }
                                  },
                                  icon: Icon(
                                    Icons.edit_note,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Obx(() => entryViewModel.images.value.length != 0
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.9,
                              // mainAxisExtent: 150,
                            ),
                            itemCount: entryViewModel.images.value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Image.file(
                                  entryViewModel.images.value[index],
                                ),
                              );
                            },
                          )
                        : SizedBox()),
                    AddVerticalSpace(30),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: BTN(
                        title: "Done",
                        color: AppColors.blue,
                        textColor: AppColors.white,
                        onPressed: () async {
                          setState(() {
                             if (name.text.isEmpty) {
                              personNameValid = true;
                            } else if (number.text.isEmpty) {
                              personNumberValid = true;
                            } else if (Cnic.text.isEmpty) {
                              personCNICValid = true;
                            } else if (Address.text.isEmpty) {
                               personAddressValid = true;
                            } else if (rooms.text.isEmpty) {
                              roomsValid = true;
                            } else if (bedrooms.text.isEmpty) {
                              bedroomsValid = true;
                            } else if (bathrooms.text.isEmpty) {
                              bathroomsValid = true;
                            } else if (amount.text.isEmpty) {
                              amountValid = true;
                            } else if (discount.text.isEmpty) {
                              discountValid = true;
                            } else if (totalAmount.text.isEmpty) {
                              totalAmountValid = true;
                            } else if (Advance.text.isEmpty) {
                              AdvanceValid = true;
                            } else if (Remaining.text.isEmpty) {
                               remainValid= true;
                            } else if (description.text.isEmpty) {
                               descriptionValid = true;
                            }
                          });
                            int time = DateTime.now().microsecondsSinceEpoch;

                            for (int i = 0;
                                i < entryViewModel.images.value.length;
                                i++) {
                              final firebaseStorage = FirebaseStorage.instance
                                  .ref()
                                  .child('images_$time')
                                  .child(
                                      '${DateTime.now().millisecondsSinceEpoch}');
                              UploadTask uploadTask = firebaseStorage
                                  .putFile(entryViewModel.images.value[i]);
                              TaskSnapshot taskSnapshot = await uploadTask;

                              await taskSnapshot.ref
                                  .getDownloadURL()
                                  .then((value) async {
                                if (value != null) {
                                  entryViewModel.imagesURL.value.add(value);
                                }
                              });
                            }

                            EntryModel entryModel = EntryModel(
                              entryID: time,
                              Name: name.text,
                              amount: double.parse(amount.text),
                              discount: double.parse(discount.text),
                              totalAmount: double.parse(totalAmount.text),
                              advance: double.parse(Advance.text),
                              remaining: double.parse(Remaining.text),
                              images: entryViewModel.imagesURL.value,
                              Address: Address.text,
                              Number: number.text,
                              CNIC: Cnic.text,
                              description: description.text, enteredBy:  FirebaseAuth.instance.currentUser!.email!,
                            );

                            await FirebaseFirestore.instance
                                .collection("bookings")
                                .doc("${time}")
                                .set(entryModel.toJson())
                                .then((value) {
                              setState(() {
                                loading = false;
                              });
                              amount.text = "";
                              discount.text = "";
                              totalAmount.text = "";
                              Advance.text = "";
                              Remaining.text = "";
                              description.text = "";
                              Get.to(
                                BookedHouse(),
                              );
                            });
                          },
                        width: Dimensions.screenWidth(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        loading
            ? Container(
                height: Dimensions.screenHeight(context),
                width: Dimensions.screenWidth(context),
                color: AppColors.white.withOpacity(0.2),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
