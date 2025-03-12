import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/Screens/newdesign/item/show.dart';
import 'package:yourdress/core/constant/color.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
 
  final scaffoldKey = GlobalKey<ScaffoldState>();
 late String ?username ;
  @override
  void initState() {
    username=FirebaseAuth.instance.currentUser?.uid.toString();
    super.initState();
    
  }

  @override
  void dispose() {
   

    super.dispose();
  }
// lig
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 36, 20, 36),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/dress.png',
                        width: 291,
                        height: 388,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '\"Your Dress \"\n Sall and Rent',
                      style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 44,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // context.pushNamed('LOGIN');
                              },
                              child: Text(
                                'long',
                                style: TextStyle(),
                              ),
                            ),
                            Text(
                              'short',
                              style: TextStyle(),
                            ),
                            Text(
                              'Ceremony',
                              style: TextStyle(),
                            ),
                            Text(
                              'Wedding ',
                              style: TextStyle(),
                            ),
                          ]
                          // divide(SizedBox(height: 11)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                                   Container(  
              
                              width: 150,
                                height: 50,
            padding: EdgeInsets.fromLTRB(5, 5, 5, 15),  
          // margin: EdgeInsets.all(5),  
          decoration: BoxDecoration(  
            //     boxShadow: [  
            //   new BoxShadow(color: Color.fromARGB(112, 0, 0, 0), offset: new Offset(0, 0.0),),  
            // ],  
            color:Color.fromARGB(83, 0, 0, 0),
            border: Border.all(color: Color.fromARGB(255, 253, 164, 191), width: 4),  
            borderRadius: BorderRadius.circular(36),  
              
          ), 
          child: InkWell(
            onTap: (){
               Get.to(()=>MyHomePage());
            },
            child: Center(child: Text("Get started",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.bold),))), ),
                                 Container(  
              
                              width: 150,
                                height: 50,
            padding: EdgeInsets.fromLTRB(5, 5, 5, 15),  
           margin: EdgeInsets.all(5),  
          decoration: BoxDecoration(  
               
            color:Color.fromARGB(83, 0, 0, 0),
            border: Border.all(color: Color.fromARGB(255, 253, 164, 191), width: 3),  
            borderRadius: BorderRadius.circular(36),  
              
          ), 
          child: InkWell(
            
             onTap: (){
              Get.to(()=>loginWidget());
            },
            child: Center(child: Text("Login ",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.bold),))), ),
     
                            // MaterialButton(
                            //   onPressed: () async {
                            //     // context.pushNamed('homeCopy');
                            //   },
                            
                            //   child:Text('Get Started') ,
                            //   // options: FFButtonOptions(
                            //   //   width: 150,
                            //   //   height: 50,
                            //   //   padding:
                            //   //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //   //   iconPadding:
                            //   //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //   //   color: AppColor.primaryColor,
                            //   //   textStyle: TextStyle()
                            //   //       .titleSmall
                            //   //       .override(
                            //   //         fontFamily: 'El Messiri',
                            //   //         color: Colors.white,
                            //   //         fontSize: 18,
                            //   //       ),
                            //   //   elevation: 3,
                            //   //   borderSide: BorderSide(
                            //   //     color: Colors.transparent,
                            //   //     width: 1,
                            //   //   ),
                            //   //   borderRadius: BorderRadius.circular(36),
                            //   // ),
                            // ),
                            // FFButtonWidget(
                            //   onPressed: () async {
                            //     context.pushNamed('home');
                            //   },
                            //   text: 'login',
                            //   options: FFButtonOptions(
                            //     width: 150,
                            //     height: 50,
                            //     padding:
                            //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //     iconPadding:
                            //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //     color: TextStyle()
                            //         .primaryBackground,
                            //     textStyle: TextStyle()
                            //         .titleSmall
                            //         .override(
                            //           fontFamily: 'El Messiri',
                            //           color:
                            //               AppColor.primaryColor,
                            //           fontSize: 18,
                            //         ),
                            //     elevation: 3,
                            //     borderSide: BorderSide(
                            //       color: AppColor.primaryColor,
                            //       width: 1,
                            //     ),
                            //     borderRadius: BorderRadius.circular(36),
                            //   ),
                            // ),
                          ],
                          // divide(SizedBox(height: 12)
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
