import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:yourdress/Screens/newdesign/Policy.dart';
import 'package:yourdress/Screens/newdesign/item/Adddress.dart';
import 'package:yourdress/core/constant/color.dart';
import 'package:yourdress/main.dart';

class PolicyPage extends StatefulWidget {
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  List<Policy> policies = [
    Policy(
      title: 'Policy 1',
      content: ' hi ',
    ),
    Policy(
      title: 'Policy 2',
      content: 'This is policy content 2...',
    ),
    Policy(
      title: 'Policy 3',
      content: 'This is policy content 3...',
    ),
    Policy(
      title: 'Policy 4',
      content: 'This is policy content 4...',
    ),
    Policy(
      title: 'Policy 5',
      content: 'This is policy content 5...',
    ),
  ];

  bool allPoliciesAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Policy Agreement Page'),
      ),
      body: ListView.builder(
        itemCount: policies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 3,
                color: Color.fromARGB(255, 245, 194, 209),
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  policies[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(policies[index].content),
                Checkbox(
                  value: policies[index].agreed,
                  onChanged: (value) {
                    setState(() {
                      policies[index].agreed = value!;
                      allPoliciesAgreed =
                          policies.every((policy) => policy.agreed);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: allPoliciesAgreed
            ? () {
                sharedpref.setString("agree", "1");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => add()),
                );
              }
            : () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Agreement Required'),
                      content: Text(
                          'Please agree to all policies before proceeding.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
        child: Text(
          'Continue,',
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
