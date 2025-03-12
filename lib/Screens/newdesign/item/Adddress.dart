import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'package:yourdress/Screens/newdesign/item/details.dart';
import 'package:yourdress/Screens/newdesign/item/editdress.dart';
import 'package:yourdress/Screens/newdesign/item/mydetails.dart';
import 'package:yourdress/Screens/newdesign/item/show.dart';
import 'package:yourdress/Screens/newdesign/item/widget.dart';
import 'package:yourdress/controller/item/additem_controller.dart';
import 'package:yourdress/core/constant/color.dart';

import 'package:yourdress/core/functions/validinput.dart';
import 'package:yourdress/widget/item/customtextformauth.dart';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  final _des = TextEditingController();
  final _priceRent = TextEditingController();
  final _priceSele = TextEditingController();
  final _title = TextEditingController();
  final _website = TextEditingController();
  final _phoneController = TextEditingController();
  final _Link = TextEditingController();
  String get link => _Link.text.trim();
  String get title => _title.text.trim();
  String get website => _website.text.trim();
  String get des => _des.text.trim();
  String get priceSele => _priceSele.text.trim();
  String get priceRent => _priceRent.text.trim();
  String get phone => _phoneController.text.trim();

  final _auth = FirebaseAuth.instance;
  String text = "";

  String dropdownValue = 'small'; // Initialize with the default value
  bool isCheckedsale = false;
  bool isCheckedrent = false;
  late UserCredential credential;

  String selectedText = 'House';

  File? myfile;
  var url;

  Map<String, Color> textColors = {
    'House': Colors.black,
    'day': Colors.black,
    'week': Colors.black,
    'month': Colors.black,
  };
  var imagename;
  final Stream<QuerySnapshot> _usersStreamPackage = FirebaseFirestore.instance
      .collection('Dress')
      .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    additemcontrollerImp controller = Get.put(additemcontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: AlignmentDirectional(0, -1),
          child: IconButton(
            icon: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 254, 230, 230),
              minRadius: 15,
              child: Icon(
                Icons.arrow_back_rounded,
                color: Color.fromARGB(255, 248, 162, 162),
                size: 24,
              ),
            ),
            onPressed: () async {
              Get.to(() => MyHomePage());
            },
          ),
        ),
        title: Text(
          'Ditals publish',
          style: TextStyle(
            color: Color.fromARGB(255, 245, 174, 174),
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Container(child: Text("Add image")),
            SizedBox(
              height: 20,
            ),
            // Generated code for this Row Widget...
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // StreamBuilder for Images
                  StreamBuilder<QuerySnapshot>(
                    stream: _usersStreamPackage,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator()  ;
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');// 
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        return Row(
                          children:
                              snapshot.data!.docs.map((DocumentSnapshot doc) {
                            Map<String, dynamic> data =
                                doc.data() as Map<String, dynamic>;
                            String imageUrl = data[
                                'url']; // Replace 'url' with your field name
                            return GestureDetector(
                              onTap: () {
                                Map<String, dynamic> data =
                                    doc.data() as Map<String, dynamic>;
                                String imageUrl = data['url'];
                                String docId = doc.id;

                             Get.to(() => mydetails(
                                data: data,
                                ID_doc: docId));
                               
                              },
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: AppColor.primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      imageUrl,
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                      return Container(); // Return an empty container if no images are available
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AppColor.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: (myfile == null)
                                ? Image.network(
                                    'https://picsum.photos/seed/123/600',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    myfile!,
                                    fit: BoxFit.cover,
                                  ),
                          )),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _showImageSourceBottomSheet(context);
                      },
                      icon: Icon(Icons.add))
                  // Add Button
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _title,
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'title ',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _des,
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'Desc',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'Size',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            suffixIcon: CustomDropdownButton(
                              value: dropdownValue,
                              items: ['small', 'large', 'medium'],
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  print(dropdownValue);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                          width: double.infinity,
                          child: Text(
                            "contact walt",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _website,
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'website',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _phoneController,
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: ' number ',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _Link,
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'add link ',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   padding: EdgeInsets.all(35),
            //   margin: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.pink.shade100, width: 4),
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: Obx(() {
            //     if (controller.selectedImage.value != null) {
            //       return Container(
            //         width: 400, // Adjust this width as needed
            //         height: 300, // Adjust this height as needed
            //         child: Image.file(
            //           controller.selectedImage.value!,
            //           fit: BoxFit
            //               .cover, // Maintain aspect ratio and cover the container
            //         ),
            //       );
            //     } else {
            //       return Center(child: Text("44".tr));
            //     }
            //   }),
            // ),

            // serviceButton(
            //   text: "اختيار صورة   ",
            //   onTap: () async {
            //     await pickImage();
            //   },
            // ),

            //
            //
            //
            // Generated code for this Column Widget...
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 10),
                        child: Text(
                          'Price',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 248, 249),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3AFDA4BF),
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 1, 2, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Rent",
                                style: TextStyle(fontSize: 18),
                              ),
                              Checkbox(
                                value: isCheckedrent,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isCheckedrent = newValue!;
                                  });
                                },
                                activeColor: Color.fromARGB(255, 255, 190, 212),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                child: Wrap(
                                  spacing: 20,
                                  runSpacing: 4,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedText = 'House';
                                          _updateTextColors('House');
                                        });
                                      },
                                      child: Text(
                                        'House',
                                        style: TextStyle(
                                            color: textColors['House']),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedText = 'day';
                                          _updateTextColors('day');
                                          print(selectedText);
                                        });
                                      },
                                      child: Text(
                                        'day',
                                        style:
                                            TextStyle(color: textColors['day']),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedText = 'week';
                                          _updateTextColors('week');
                                          print(selectedText);
                                        });
                                      },
                                      child: Text(
                                        'week',
                                        style: TextStyle(
                                            color: textColors['week']),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedText = 'month';
                                          _updateTextColors('month');
                                          print(selectedText);
                                        });
                                      },
                                      child: Text(
                                        'month',
                                        style: TextStyle(
                                            color: textColors['month']),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Adding the TextFormField
                      Expanded(
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                            child: TextFormField(
                              controller: _priceRent,
                              style: TextStyle(
                                  fontSize: 14), // Adjust the font size here
                              decoration: InputDecoration(
                                labelText: 'Enter price ',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 245, 246),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3AFDA4BF),
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 1, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Sale",
                            style: TextStyle(fontSize: 18),
                          ),
                          Checkbox(
                            value: isCheckedsale,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isCheckedsale = newValue!;
                              });
                            },
                            activeColor: Color.fromARGB(
                                255, 255, 190, 212), // Set the color to pink
                          ),
                        ],
                      ),
                    ),
                  ),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
//                 child: Container(
//                   width: 100,
//                   height: 10,
//                   decoration: BoxDecoration(
//                     color: AppColor.primaryColor,
//                     borderRadius: BorderRadius.circular(8),
//                     shape: BoxShape.rectangle,
//                     border: Border.all(
// color: AppColor.primaryColor,
//                       width: 2,
//                     ),
//                   ),

//                 ),
//               ),
//             ],
//           ),
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                        child: TextFormField(
                          controller: _priceSele,
                          style: TextStyle(
                              fontSize: 14), // Adjust the font size here
                          decoration: InputDecoration(
                            labelText: 'Enter price ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primaryColor,
                    ),
                    height: 50,
                    width: 150,
                    child: MaterialButton(
                      onPressed: () async {
                        await add();
                      },
                      child: Text(
                        'Create Company',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.spaceEvenly,
                  verticalDirection: VerticalDirection.up,
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.primaryColor,
                        ),
                        height: 50,
                        width: 150,
                        child: MaterialButton(
                          onPressed: () async {
                            Get.to(() => MyHomePage());
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Choose an image from the camera"),
              onTap: () {
                _onCameraButtonPressed();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Choose an image from the Gallery"),
              onTap: () {
                _onGalleryButtonPressed();
              },
            ),
          ],
        );
      },
    );
  }

  Future uploadImage() async {
    var rendom = Random().nextInt(1000);
    imagename = "$rendom$imagename";
    var imageref = FirebaseStorage.instance.ref("images/$imagename");

    try {
      await imageref.putFile(myfile!);
      url = await imageref.getDownloadURL();
      print(url.toString());
    } on FirebaseException catch (e) {
      print(e);
    }
    return url;
  }

  Future _onCameraButtonPressed() async {
    try {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (xfile != null) {
        setState(() {
          myfile = File(xfile.path);
          imagename = basename(xfile.path);
          print(imagename);
        });
      }
    } on PlatformException catch (e) {
      print("================================");
      print(e);
    }
  }

  Future _onGalleryButtonPressed() async {
    try {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xfile != null) {
        setState(() {
          myfile = File(xfile.path);
          imagename = basename(xfile.path);
          print(imagename);
        });
      }
    } on PlatformException catch (e) {
      print("================================");
      print(e);
    }
  }

  void _updateTextColors(String selectedOption) {
    textColors.forEach((option, color) {
      if (option == selectedOption) {
        textColors[option] =
            Color.fromARGB(255, 252, 38, 113); // Change to your desired color
      } else {
        textColors[option] = Colors.black; // Change to your default color
      }
    });
  }

  add() async {
    CollectionReference Dress = FirebaseFirestore.instance.collection('Dress');// 
    print("============================>");
    print(FirebaseAuth.instance.currentUser?.uid.toString());
    // {
    url = await uploadImage();
    print("===========================================================?");
 print(url);
    await Dress.add({
      "des": des,
      "title": title,
      "size": dropdownValue,
      "website": website,
      "link": link,
      "phone": phone,
      "typerent": selectedText,
      "rent": isCheckedrent,
      "sale": isCheckedsale,
      "pricesale": priceSele,
      "pricerent": priceRent,
      "user_id": FirebaseAuth.instance.currentUser?.uid.toString(),
      "url": url.toString()
    }).then((value) {
      Get.to(() => MyHomePage());
    }).catchError((e) {
      print("this is error $e");//
    });
    // }
  }
}
