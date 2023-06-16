import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Models/entry_model.dart';

class EntryViewModel extends GetxController{

  RxList<dynamic> images = <dynamic>[].obs;
  RxList<dynamic> imagesURL = [].obs;
  RxList<EntryModel> entryList = <EntryModel>[].obs;


  Future getEntryonDate() async {
    // entryList.value.clear();
    await FirebaseFirestore.instance.collection("bookings").snapshots().listen((event) {
      entryList.value = EntryModel.jsonToListView(event.docs);
    });
    // print("+++++++++++++++${entryList}");
  }

}