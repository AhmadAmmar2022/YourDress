import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdress/Screens/newdesign/Auth/signup.dart';
import 'package:yourdress/Screens/newdesign/item/show.dart';
import 'package:yourdress/core/constant/color.dart';
import 'package:yourdress/core/functions/alertexitapp.dart';

class loginWidget extends StatefulWidget {
  const loginWidget({Key? key}) : super(key: key);

  @override
  _loginWidgetState createState() => _loginWidgetState();
}

class _loginWidgetState extends State<loginWidget> {
 
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late UserCredential credential;
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

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
                                                '                login \n  Dont have an account ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 22,
                                                    color: Colors.black),
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
                                              controller:_emailController,
                                              autofocus: true,
                                              autofillHints: [
                                                AutofillHints.email
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
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
                                                fillColor: Color.fromARGB(32, 253, 253, 253),
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
                                                  controller: _passwordController,
                                                  autofillHints: [
                                                    AutofillHints.password
                                                  ],
                                                  decoration: InputDecoration(
                                                    labelText: 'Password',
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
                                                    fillColor: Color.fromARGB(161, 253, 253, 253),
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
                                  onTap: ()async{
                                await   login(); 
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
                                      "sign In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),SizedBox(height: 20,),
                              
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  padding: EdgeInsets.fromLTRB(55,1, 5, 5),
                                  // margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    //     boxShadow: [
                                    //   new BoxShadow(color: Color.fromARGB(112, 0, 0, 0), offset: new Offset(0, 0.0),),
                                    // ],
                                    color: Color.fromARGB(255, 252, 250, 251),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 253, 164, 191),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text(
                                    "forgot password ",
                                    style: TextStyle(
                                    color: Color.fromARGB(255, 6, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              // Generated code for this Button Widget...
      
      
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
                                          Get.to(()=>SignupWidget());
                                        },
                                        child: Text(
                                          'Or sign up ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                            
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
                                      color: Color.fromARGB(0, 248, 248, 248),
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
  login() async{

   
       try {
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
                   
                  Get.to(()=>MyHomePage());
       
       } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          alertAuth();
       
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
              alertAuth();
        }
      
       }
         catch (e) {
            alertAuth();
      }
    

         
    
  }
}
