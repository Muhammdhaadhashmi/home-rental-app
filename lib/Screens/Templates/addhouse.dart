// import 'package:flutter/material.dart';
//
//  class Addhousepage extends StatefulWidget {
//    final String houseName;final String houseImage;
//  final double price;
//    HouseBookingPage({required this.houseName, required this.houseImage, required this.price});
//    @override
//    _AddhousepageState createState() => _AddhousepageState();
//  }
//
//    class _AddhousepageState extends State<Addhousepage> {
//     TextEditingController nameController = TextEditingController();
//      TextEditingController phoneController = TextEditingController();
//      TextEditingController emailController = TextEditingController();
//      TextEditingController startDateController = TextEditingController();
// //   // TextEditingController endDateController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.purple,
// //     );
// //   }
// // }
//
//
//
// // class HouseBookingPage extends StatefulWidget {
// //   final String houseName;
// //   final String houseImage;
// //   final double price;
// //
// //   HouseBookingPage({required this.houseName, required this.houseImage, required this.price});
// //
// //   @override
// //   _HouseBookingPageState createState() => _HouseBookingPageState();
// // }
// //
// // class _HouseBookingPageState extends State<HouseBookingPage> {
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController phoneController = TextEditingController();
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController startDateController = TextEditingController();
// //   TextEditingController endDateController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Book ${widget.houseName}'),
// //         ),
// //         body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //     child: SingleChildScrollView(
// //     child: Column(
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //     Container(
// //     height: 200,
// //     width: double.infinity,
// //     decoration: BoxDecoration(
// //     image: DecorationImage(
// //     image: NetworkImage(widget.houseImage),
// //     fit: BoxFit.cover,
// //     ),
// //     borderRadius: BorderRadius.circular(16.0),
// //     ),
// //     ),
// //     SizedBox(height: 16.0),
// //     Text(
// //     widget.houseName,
// //     style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
// //     ),
// //     SizedBox(height: 8.0),
// //     Text(
// //     'Price: ${widget.price}',
// //     style: TextStyle(fontSize: 18.0),
// //     ),
// //     SizedBox(height: 16.0),
// //     TextField(
// //     controller: nameController,
// //     decoration: InputDecoration(
// //     labelText: 'Full Name',
// //     border: OutlineInputBorder(),
// //     ),
// //     ),
// //     SizedBox(height: 16.0),
// //     TextField(
// //     controller: phoneController,
// //     keyboardType: TextInputType.phone,
// //     decoration: InputDecoration(
// //     labelText: 'Phone Number',
// //     border: OutlineInputBorder(),
// //     ),
// //     ),
// //     SizedBox(height: 16.0),
// //     TextField(
// //     controller: emailController,
// //     keyboardType: TextInputType.emailAddress,
// //     decoration: InputDecoration(
// //     labelText: 'Email Address',
// //     border: OutlineInputBorder(),
// //     ),
// //     ),
// //     SizedBox(height: 16.0),
// //     TextField(
// //     controller: startDateController,
// //     decoration: InputDecoration(
// //     labelText: 'Start Date',
// //     border: OutlineInputBorder(),
// //     ),
// //     onTap: () async {
// //     DateTime? date = await showDatePicker(
// //     context: context,
// //     initialDate: DateTime.now(),
// //     firstDate: DateTime.now(),
// //     lastDate: DateTime(2100),
// //     );
// //     if (date != null) {
// //     startDateController.text = date.toString();
// //     }
// //     },
// //     ),
// //     SizedBox(height: 16.0),
// //     TextField(
// //     controller: endDateController,
// //     decoration: InputDecoration(
// //     labelText: 'End Date',
// //     border: OutlineInputBorder(),
// //     ),
// //     onTap: () async {
// //     DateTime? date = await showDatePicker(
// //     context: context,
// //     initialDate: DateTime.now(),
// //     firstDate: DateTime.now(),
// //     lastDate: DateTime(2100),
// //     );
// //     if (date != null) {
// //     endDateController.text = date.toString();
// //     }
// //     },
// //     ),
// //     SizedBox(height: 16.0),
// //     FloatingActionButton(
// //     onPressed: () {
// //     // Code to handle booking
// //     // You can use the data from the controllers to book the house
// //     // For example:
// //     String name = nameController.text;
// //     String phone = phoneController.text;
// //     String email = emailController.text;
// //     String startDate = startDateController.text;
// //     String endDate = endDateController.text;
// //     // print('Booking for $name with phone number 
// //     } ) ] )
// //     )
// //     )
// //     );
// //
// //   }
// // }
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:home_rental/Screens/HomePage.dart';
// import 'package:image_picker/image_picker.dart';
//
// class House {
//   String address;
//   int houseNo;
//   String city;
//   int rooms;
//   int bedrooms;
//   int bathrooms;
//
//   House({required this.address, required this.houseNo, required this.city, required this.rooms, required this.bedrooms, required this.bathrooms});
// }
//
// class AddHouseScreen extends StatefulWidget {
//   @override
//   _AddHouseScreenState createState() => _AddHouseScreenState();
// }
//
// class _AddHouseScreenState extends State<AddHouseScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _address = '';
//   int _houseNo = 0;
//   String _city = '';
//   int _rooms = 0;
//   int _bedrooms = 0;
//   int _bathrooms = 0;
//   File? imageFile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Add a New House For Renting'),
//         ),
//         body: SingleChildScrollView(
//             child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Form(
//                     key: _formKey,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'Address'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the address';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {
//                               _address = value;
//                             },
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'House No'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the house no';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               _houseNo = int.parse(value);
//                             },
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'City'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the city';
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {
//                               _city = value;
//                             },
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'Rooms'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the number of rooms';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               _rooms = int.parse(value);
//                             },
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'Bedrooms'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the number of bedrooms';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               _bedrooms = int.parse(value);
//                             },
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(labelText: 'Bathrooms'),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter the number of bathrooms';
//                               }
//                               return null;
//                             },
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               _bathrooms = int.parse(value);
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Center(
//                             child: IconButton(onPressed: (){
//                               _getFromGallery();
//                             }, icon:Icon(Icons.add_a_photo)
//                             ),
//                           ),
//                           SizedBox(height: 25),
//                           Center(
//                             child: FloatingActionButton(
//                               child: Text("Apply"),
//                                 onPressed: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     House house = House(
//                                       address: _address,
//                                       houseNo: _houseNo,
//                                       city: _city,
//                                       rooms: _rooms,
//                                       bedrooms: _bedrooms,
//                                       bathrooms: _bathrooms,
//
//                                     );
//                                   }
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
//                                 }
//
//
//                             ),
//                           )
//                         ]
//                     )
//                 )
//             )
//         )
//     );
//   }
// }
// _getFromGallery() async {
//   PickedFile? pickedFile = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     setState(() {
//        var imageFile = File(pickedFile.path);
//     });
//   }
// }
//
// void setState(Null Function() param0) {
// }
//
//
//
