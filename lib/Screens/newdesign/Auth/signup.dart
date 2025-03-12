import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/core/constant/color.dart';
import 'package:yourdress/core/constant/routes.dart';
import 'package:yourdress/core/functions/alertexitapp.dart';
import 'package:yourdress/core/functions/validinput.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
   final _userName = TextEditingController();
   final _email = TextEditingController();
   final _phoneController = TextEditingController();
   final _passwordController = TextEditingController();
   final _auth = FirebaseAuth.instance;
   late UserCredential credential;
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
   String get userName => _userName.text.trim();
   String get phone => _phoneController.text.trim();
  
  String get password => _passwordController.text.trim();
 String get email => _email.text.trim();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              
              "assets/images/login.png",
              
            ),
      
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Align(
                    //   alignment: AlignmentDirectional(-1, -1),
                    //   child: Padding(
                    //     padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                    //     child: FlutterFlowIconButton(
                    //       borderColor: FlutterFlowTheme.of(context).tertiary,
                    //       borderRadius: 20,
                    //       borderWidth: 1,
                    //       buttonSize: 44,
                    //       fillColor: FlutterFlowTheme.of(context).tertiary,
                    //       icon: Icon(
                    //         Icons.chevron_left_outlined,
                    //         color: FlutterFlowTheme.of(context).primaryText,
                    //         size: 24,
                    //       ),
                    //       onPressed: () async {
                    //         context.pushNamed('homeCopy');
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 36, 16, 16),
                          child: Form(
                            key: formstate,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Container(
                                                // width: 167,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00F8F8F8),
                                                ),
                                                child: Text(
                                                  'Create new Account',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 22,
                                                      color: Color.fromARGB(255, 0, 0, 0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 40, 0, 36),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 16),
                                            child: Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                validator:(val) {
                                                return validInput(val!, 3, 12, "username");
                                                               },
                                                controller: _userName,
                                                autofocus: true,
                                                autofillHints: [
                                                  AutofillHints.email
                                                ],
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'username',
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColor.primaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColor.primaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColor.primaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColor.primaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color.fromARGB(255, 253, 253, 253),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(24, 24, 24, 24),
                                                  prefixIcon: Icon(
                                                    Icons.mail,
                                                    color: AppColor.primaryColor,
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 16),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                     validator:(val) {
                                                return validInput(val!, 10, 15, "phone");
                                                               },
                                                    controller: _phoneController,
                                                    autofillHints: [
                                                      AutofillHints.password
                                                    ],
                                                    decoration: InputDecoration(
                                                      labelText: 'phone number',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: AppColor
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: AppColor
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              AppColor.primaryColor,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              AppColor.primaryColor,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(255, 253, 253, 253),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 24, 24, 24),
                                                      prefixIcon: Icon(
                                                        Icons.password,
                                                        color:
                                                            AppColor.primaryColor,
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
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 16),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                     validator:(val) {
                                                return validInput(val!, 10, 15, "email");// 
                                                               },
                                                    controller: _email,
                                                    autofillHints: [
                                                      AutofillHints.password
                                                    ],
                                                    decoration: InputDecoration(
                                                      labelText: 'email ',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: AppColor
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: AppColor
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              AppColor.primaryColor,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              AppColor.primaryColor,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(255, 253, 253, 253),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 24, 24, 24),
                                                      prefixIcon: Icon(
                                                        Icons.password,
                                                        color:
                                                            AppColor.primaryColor,
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
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 16),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                          validator: (val) {
                                               return validInput(val!, 3, 20, "password");
                                                              },
                                                    controller: _passwordController,
                                                    autofillHints: [
                                                      AutofillHints.password
                                                    ],
                                                    decoration: InputDecoration(
                                                      labelText: 'password',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: AppColor
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: AppColor
                                                                .primaryColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              AppColor.primaryColor,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              AppColor.primaryColor,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                      ),
                                                      filled: true,
                                                      fillColor: Color.fromARGB(255, 253, 253, 253),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24, 24, 24, 24),
                                                      prefixIcon: Icon(
                                                        Icons.password,
                                                        color:
                                                            AppColor.primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    onTap: () async{
                                      await  signUp();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 52,
                                      padding: EdgeInsets.fromLTRB(1, 1, 5, 5),
                                      // margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        //     boxShadow: [
                                        //   new BoxShadow(color: Color.fromARGB(112, 0, 0, 0), offset: new Offset(0, 0.0),),
                                        // ],
                                        color: Color.fromARGB(255, 253, 164, 191),
                                        border: Border.all(
                                            color: Color.fromARGB(255, 253, 164, 191),
                                            width: 4),
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "sign up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 24),
                                        child: InkWell(
                                          onTap: (){
                                            Get.to(()=>loginWidget());
                                          },
                                          child: Text(
                                            'Or login with',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 52,
                                      padding: EdgeInsets.fromLTRB(1, 1, 5, 10),
                                      // margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        //     boxShadow: [
                                        //   new BoxShadow(color: Color.fromARGB(112, 0, 0, 0), offset: new Offset(0, 0.0),),
                                        // ],
                                        color: Color.fromARGB(45, 255, 254, 255),
                                        border: Border.all(
                                            color:
                                                Color.fromARGB(255, 253, 164, 191),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "continue with Google",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//   signUp() async{
//    setState(() {
//       CircularProgressIndicator();
//    });
    
// if (  formstate.currentState!.validate()) {
//       try {
//         await _auth
//             .createUserWithEmailAndPassword(
//               email: email,
//               password: password
//             )
//             .then((value) => {postDetailsToFirestore(email)});
//                    Get.to(()=>loginWidget());
//         print("==============================>hallo ==================================");
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           alertAuth();
//           print('The password provided is too weak.');
//         } else if (e.code == 'email-already-in-use') {
//          alertAuth();
//           print('The account already exists for that email.');
//         }
//       }
      
//        catch (e) {
//        Get.defaultDialog(title:"تعذرت العملية ");
//       }
    
//     }
     
   

//   }
 
  //   postDetailsToFirestore(String email) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   var user = _auth.currentUser;
  //   CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  //   ref.doc(user!.uid).set({
  //     "email": email,
  //     "username": userName,
  //     "phone":phone,
  //   });
  //   // Get.to(() =>Login());
  //   //
  // }


  postDetailsToFirestore(String email) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = _auth.currentUser; // تأكد من الحصول على المستخدم الحالي

  if (user != null) { // التحقق من أن المستخدم غير null
    CollectionReference ref = firebaseFirestore.collection('Users');
    await ref.doc(user.uid).set({
      "email": email,
      "username": userName,
      "phone": phone,
    }).then((_) {
      print("✅ بيانات المستخدم تم تخزينها بنجاح!");
    }).catchError((error) {
      print("❌ فشل تخزين البيانات: $error");
    });
  } else {
    print("❌ خطأ: لم يتم العثور على المستخدم الحالي!");
  }
}
signUp() async {
  if (formstate.currentState!.validate()) {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // انتظر حتى يتم تسجيل المستخدم قبل تخزين بياناته
      await postDetailsToFirestore(email);

      Get.to(() => loginWidget()); // الانتقال لصفحة تسجيل الدخول
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        alertAuth();
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        alertAuth();
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.defaultDialog(title: "تعذرت العملية");
      print("❌ خطأ غير متوقع: $e");
    }
  }
}



}
