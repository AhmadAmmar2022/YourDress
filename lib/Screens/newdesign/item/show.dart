import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/Screens/newdesign/PolicyPage.dart';
import 'package:yourdress/Screens/newdesign/item/Adddress.dart';
import 'package:yourdress/Screens/newdesign/item/details.dart';
import 'package:yourdress/Screens/newdesign/item/search.dart';
import 'package:yourdress/Screens/newdesign/profile.dart';
import 'package:yourdress/core/constant/color.dart';
import 'package:yourdress/main.dart';

enum ItemType {
  sale,
  rent,
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Stream<QuerySnapshot> _usersStreamPackage =
      FirebaseFirestore.instance.collection('Dress').snapshots();

  ItemType selectedType = ItemType.rent;

  String dynamicUsername = 'Undefined';

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: // Generated code for this FloatingActionButton Widget...
          FloatingActionButton.extended(
        onPressed: () async {
          print("==============================>");
          print(FirebaseAuth.instance.currentUser?.uid);
          FirebaseAuth.instance.currentUser?.uid == null
              ? Get.to(() => loginWidget())
              : sharedpref.getString("agree") =="1"
                  ? Get.to(() => add())
                  : Get.to(() => PolicyPage());
        },
        backgroundColor: AppColor.primaryColor,
        icon: Icon(
          Icons.add,
        ),
        elevation: 8,
        label: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'add dress',
          ),
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/four.png",
                  fit: BoxFit.cover,
                ))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 65, // Adjust the height as needed
                  margin: EdgeInsets.fromLTRB(10, 50, 5, 1),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 16, 6),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Container(
                            width: 53,
                            height: 53,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.pink.shade100,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Get.to(() => UserProfile());
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'assets/images/person.png',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Welcome\n $dynamicUsername',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: AppColor.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.search_rounded,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            Get.to(() => SearchGridView());
                          },
                        ),
                      ),
                    ],
                  ), // Replace with your desired color
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      selectedType = ItemType.sale;
                      Get.forceAppUpdate();
                    },
                    child: Container(
                      width: 130,
                      height: 54,
                      decoration: BoxDecoration(
                        color: selectedType == ItemType.sale
                            ? Color.fromARGB(255, 250, 45, 113)
                            : Color(0xFFFDA4BF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                              child: Text('Sale',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        selectedType = ItemType.rent;
                        Get.forceAppUpdate();
                      },
                      child: Container(
                        width: 130,
                        height: 54,
                        decoration: BoxDecoration(
                          color: selectedType == ItemType.rent
                              ? Color.fromARGB(255, 250, 45, 113)
                              : AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                                child: Text(
                                  'Rent',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStreamPackage,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    final filteredDocs = snapshot.data!.docs.where((doc) {
                      final itemData = doc.data() as Map<String, dynamic>;
                      return selectedType == ItemType.sale
                          ? itemData['sale'] == true
                          : itemData['rent'] == true;
                    }).toList();
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.6,
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 2, // Spacing between columns
                        mainAxisSpacing: 7, // Spacing between rows
                      ),
                      itemCount: filteredDocs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => details(
                                data: snapshot.data!.docs[index],
                                ID_doc: snapshot.data!.docs[index].id));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color.fromARGB(255, 245, 194, 209),
                              ),
                            ),
                            margin: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minHeight: 150,
                                        maxHeight: 200,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "${snapshot.data!.docs[index]["url"]}",
                                          height: 300,
                                          width: 250,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 1, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 35,
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Text(
                                        "${snapshot.data!.docs[index]["title"]}",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 37, 37, 37),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(1, 0, 2, 0),
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text(
                                          "Used",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 249, 179, 179),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          1, 0, 2, 0), // Adjusted padding here
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Text(
                                          "${snapshot.data!.docs[index]["size"]}",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 56, 56, 56),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional
                                            .centerEnd, // Aligned to the right
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: CircleAvatar(
                                            child: Icon(
                                              Icons.phone_enabled_outlined,
                                              color: Color.fromARGB(
                                                  255, 249, 248, 248),
                                            ),
                                            backgroundColor:
                                                AppColor.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Future fetchDataFromFirestore() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        setState(() {
          dynamicUsername = snapshot['username'];
          print("=========================>");
          print(dynamicUsername);
        });
      }
    });
  }
}// 
