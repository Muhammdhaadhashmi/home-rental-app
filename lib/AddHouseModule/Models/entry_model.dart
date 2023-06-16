import 'package:cloud_firestore/cloud_firestore.dart';

class EntryModel {
  EntryModel( {
    required this.entryID,
    required this.Name,
    required this.amount,
    required this.discount,
    required this.totalAmount,
    required this.advance,
    required this.remaining,
    required this.images,
    required this.description,
    required this.enteredBy,
    required this.Number,
    required this.CNIC,
    required this.Address,

  });

  final int entryID;

  final String Name;
  final String enteredBy;
  final String description;
  final String Number;
  final String CNIC;
  final String Address;
  final double amount;
  final double discount;
  final double totalAmount;
  final double advance;
  final double remaining;
  final List<dynamic> images;




  factory EntryModel.fromJson(DocumentSnapshot doc) =>
      EntryModel(
        description: (doc.data() as dynamic)["description"] ?? "",
        enteredBy: (doc.data() as dynamic)["enteredBy"] ?? "",
        Name: (doc.data() as dynamic)["Name"] ?? "",
        Number: (doc.data() as dynamic)["Number"] ?? "",
        entryID: (doc.data() as dynamic)["entryID"] ?? 0,
         CNIC: (doc.data() as dynamic)["CNIC"] ?? "",
        Address: (doc.data() as dynamic)["Address"] ?? "",
        amount: (doc.data() as dynamic)["amount"] ?? 0.0,
        discount: (doc.data() as dynamic)["discount"] ?? 0.0,
        totalAmount: (doc.data() as dynamic)["totalAmount"] ?? 0.0,
        advance: (doc.data() as dynamic)["givenAmount"] ?? 0.0,
        remaining: (doc.data() as dynamic)["returnAmount"] ?? 0.0,
        images: (doc.data() as dynamic)["images"] ?? [],
      );

  Map<String, dynamic> toJson() =>
      {
        "entryID": entryID,
        "Name": Name,
        "enteredBy": enteredBy,
        "amount": amount,
        "discount": discount,
        "totalAmount": totalAmount,
        "givenAmount": advance,
        "returnAmount": remaining,
        "images": images,
        "Number": Number,
        "CNIC": CNIC,
        "Address": Address,
        "description": description,
      };

  static List<EntryModel> jsonToListView(List<dynamic> data) {
    return data.map((e) => EntryModel.fromJson(e)).toList();
  }
}
