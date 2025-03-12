import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/core/constant/color.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<DocumentSnapshot> userDataFuture;

  @override
  void initState() {
    userDataFuture = fetchDataFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('User Profile'),
        actions: [
        IconButton(onPressed:(){
              signOut();
        }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No user data found.'));
          }

          final userData = snapshot.data!;
          final dynamicUsername = userData['username'];
          final dynamicEmail = userData['email'];
          final dynamicphone=userData['phone'];
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColor.primaryColor,
                  child: Text(
                    dynamicUsername.substring(0, 1),
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Username: $dynamicUsername',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: $dynamicEmail',
                  style: TextStyle(fontSize: 18),
                ),
                 Text(
                  'phone: $dynamicphone',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot> fetchDataFromFirestore() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance.collection('Users').doc(uid).get();
  }
  Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.to(()=>loginWidget());
  } catch (e) {
    print('Error signing out: $e');
  }
}
}

