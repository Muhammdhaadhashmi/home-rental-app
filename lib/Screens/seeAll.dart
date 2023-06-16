// // import 'package:flutter/material.dart';
// //
// // class House {
// //   final String username;
// //   final String imageUrl;
// //   final String address;
// //   final String phoneNumber;
// //
// //   const House({
// //     required this.username,
// //     required this.imageUrl,
// //     required this.address,
// //     required this.phoneNumber,
// //   });
// // }
// //
// // class HouseList extends StatefulWidget {
// //   const HouseList({Key? key}) : super(key: key);
// //
// //   @override
// //   _HouseListState createState() => _HouseListState();
// // }
// //
// // class _HouseListState extends State<HouseList> {
// //   final List<House> _houses = [
// //     House(
// //       username: 'John Doe',
// //       imageUrl: 'asset/images/house1.jpg',
// //       address: '123 Main St, Anytown USA',
// //       phoneNumber: '+1 (555) 555-1234',
// //     ),
// //     House(
// //       username: 'Jane Smith',
// //       imageUrl: 'https://example.com/user.jpg',
// //       address: '456 Elm St, Anytown USA',
// //       phoneNumber: '+1 (555) 555-5678',
// //     ),
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('House List'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: _houses.length,
// //         itemBuilder: (context, index) {
// //           final house = _houses[index];
// //           return Card(
// //             child: ListTile(
// //               leading: CircleAvatar(
// //                 backgroundImage: AssetImage(house.imageUrl),radius:20,
// //               ),
// //               title: Text(house.username),
// //               subtitle: Row(
// //                 children: <Widget>[
// //                   const Icon(Icons.location_on),
// //                   const SizedBox(width: 4),
// //                   Expanded(
// //                     child: Text(
// //                       house.address,
// //                       maxLines: 2,
// //                       overflow: TextOverflow.ellipsis,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               trailing: IconButton(
// //                 icon: const Icon(Icons.call),
// //                 onPressed: () {
// //                   // TODO: Implement calling functionality
// //                 },
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // TODO: Implement adding new house functionality
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:home_rental/Screens/HomePage.dart';
//
// import 'HomePage.dart';
//
// // Define a data class for the image data
// class ImageData {
//   final String imagePath;
//   final String name;
//   final String description;
//
//
//   ImageData({
//     required this.imagePath,
//     required this.name,
//     required this.description,
//   });
// }
//
// class ListViewDemo extends StatelessWidget {
//   const ListViewDemo({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     // Define a list of ImageData objects
//     List<ImageData> imageDataList = [
//       ImageData(
//         imagePath: "asset/images/house1.jpg",
//         name: "Bilal House",
//         description: "Harron Town,R.Y.k.",
//       ),
//       ImageData(
//         imagePath: "asset/images/house2.jpg",
//         name: "Niazi Villas",
//         description: "Niazi Villas",
//       ),ImageData(
//         imagePath: "asset/images/house3.jpg",
//         name: "House No. 234",
//         description: "22/A,Block-C,Satellite Town,Ryk.",
//       ),ImageData(
//         imagePath: "asset/images/hostel1.jpg",
//         name: "Cool Boys Hostel",
//         description: "Abu Dhabi Road,Ryk.",
//       ),ImageData(
//         imagePath: "asset/images/house8.jpg",
//         name: "Hassan Cottage",
//         description: "Hassan Colony,Ryk.",
//       ),ImageData(
//         imagePath: "asset/images/house1.jpg",
//         name: "House # 23",
//         description: "Harron Town,R.Y.k.",
//       ),ImageData(
//         imagePath: "asset/images/hostel1.jpg",
//         name: "Mian House",
//         description: "Jinnah Park,Ryk.",
//       ),ImageData(
//         imagePath: "asset/images/house1.jpg",
//         name: "Rehman Banglow",
//         description: "Etihad Town",
//       ),ImageData(
//         imagePath: "asset/images/house2.jpg",
//         name: "Farhad House",
//         description: "Gulshan Usman,Ryk.",
//       ),
//     ImageData(
//     imagePath: "asset/images/desire1.jpg",
//     name: "Desire Farm & Swimming Pool",
//     description: "Manthan Rd.Ryk.",
//     ),
//       // add more images here...
//     ];
//
//     return Scaffold(appBar: AppBar(
//
//
//       backgroundColor: Colors.white,
//       leading: Drawer(
//         child: IconButton( onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
//         },
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.blue,
//           ),
//         ),
//
//
//       ),
//       actions:<Widget> [
//
//
//       ],
//       title:  Column(
//         children: [
//           Text("FAR FROM",
//             style: TextStyle(color: Colors.blue,fontSize: 17.0,fontStyle:FontStyle.italic,
//             ),),Text("HOME",
//             style: TextStyle(
//               color: Colors.black,fontSize: 19.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
//             ),
//
//           )
//         ],
//
//
//       ),centerTitle: true,
//
//     ),
//         body:
//
//         // Create a ListView widget with the list of ImageData objects
//         SafeArea(
//           minimum: EdgeInsets.only(top: 35,bottom: 15),
//           child: ListView.separated(
//               itemCount: imageDataList.length, // Set the number of items in the list
//               separatorBuilder: (BuildContext context, int index) => const Divider(), // Add a divider between each item in the list
//               itemBuilder: (BuildContext context, int index) {
//                 final imageData = imageDataList[index]; // Get the ImageData object at the current index
//                 return ListTile( onTap: (){ },
//                   leading: Image.asset(imageData.imagePath), // Display the image on the left side of the ListTile
//                   title: Text(imageData.name), // Display the name as the title of the ListTile
//                   subtitle: Text(imageData.description), // Display the description as the subtitle of the ListTile
//                trailing: IconButton(onPressed: () { },
//                icon: Icon(Icons.call,color: Colors.blue, ),) );
//               }
//           ),
//         )
//     );
//   }
// }