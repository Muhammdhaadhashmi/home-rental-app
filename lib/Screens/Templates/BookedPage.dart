// import 'package:flutter/material.dart';
//
// class BookedPage extends StatefulWidget {
//   @override
//   _BookedPageState createState() => _BookedPageState();
// }
//
// class _BookedPageState extends State<BookedPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.pink,
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../HomePage.dart';

class House {
  String emailaddress;
  int houseNo;
  String city;
  int contact;


  House({required this.emailaddress, required this.houseNo, required this.city, required this.contact, });
}

class BookedHouse extends StatefulWidget {
  @override
  _BookedHouseState createState() => _BookedHouseState();
}

class _BookedHouseState extends State<BookedHouse> {
  final _formKey = GlobalKey<FormState>();
  String _emailaddress = '';
  int _houseNo = 0;
  String _city = '';
  int _contactNo = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booked House for Rent'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email Address'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the email address';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _emailaddress = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'House No'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the house no';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _houseNo = int.parse(value);
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'City'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the city';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _city = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Contact Number'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the number of rooms';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _contactNo = int.parse(value);
                            },
                          ),

                          SizedBox(height: 25),
                          Center(
                            child: FloatingActionButton(
                                child: Text("Booked"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    House house = House(
                                      emailaddress: _emailaddress,
                                      houseNo: _houseNo,
                                      city: _city,
                                      contact: _contactNo,

                                    );
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));

                                }


                            ),
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}
