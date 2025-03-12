import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/core/constant/color.dart';

class details extends StatefulWidget {
  final data;
  final ID_doc;
  const details({
    super.key,
    required this.data,
    this.ID_doc,
  });

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  void initState() {
    title = widget.data['title'].toString();
    print(title);
    pricerent = widget.data['pricerent'].toString();
    print(pricerent);
    imageURl = widget.data['url'].toString();
    typerent = widget.data['typerent'].toString();
    type = widget.data['rent'].toString();
    size = widget.data['size'].toString();
    des = widget.data['des'].toString();
    phone=widget.data['phone'].toString();
    super.initState();
  }

  late String title;
  late String size;
  late String imageURl;
  late String pricerent;
  late String type;
  late String des;
  late String typerent;
  late String phone;

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: 10,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$" + pricerent.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),

        SizedBox(height: 10.0),
        // Text(
        // name,
        //   style: TextStyle(color: Colors.white, fontSize: 45.0),
        // ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            // Expanded(
            //     flex: 6,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 10.0),
            //         child: Text(
            //         name.toString(),
            //           style: TextStyle(color: Colors.white),
            //         ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _showImageDialog(imageURl);
          },
          child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage("$imageURl"),
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    );

    final bottomContentText = Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'title',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
            Text(
              '${title.toString()}',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price rent',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
            Text(
              '$pricerent',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
            Text(
              '$size',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'type',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
            Text(
              '$type',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
          ],
        ),
  Container(
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.symmetric(vertical: 10), // مسافة تفصل عن الأعلى والأسفل
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.pink, width: 2), // إطار وردي
    borderRadius: BorderRadius.circular(10), // زوايا ناعمة
    boxShadow: [  // إضافة ظل خفيف
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
        spreadRadius: 2,
        offset: Offset(2, 3),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Description:',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
      SizedBox(height: 5), // مسافة صغيرة بين العنوان والنص
      Text(
        des,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    ],
  ),
)

,
           Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'phone number',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
            Text(
              '$phone',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'El Messiri',
                  color: Color.fromARGB(255, 1, 1, 1)),
            ),
          ],
        ),
        // Generated code for this Row Widget...
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 1, 10, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 252, 206, 206), width: 2),
                    borderRadius: BorderRadius.circular(8),
                    // boxShadow: [
                    //   new BoxShadow(color: Color.fromARGB(255, 230, 236, 230), offset: new Offset(2.0, 2.0),),
                    // ],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    child: Text('    $pricerent \$ / $typerent     '),
                    height: 44,
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 24, 0),
                    color: Color.fromARGB(255, 252, 249, 250),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 60,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FirebaseAuth.instance.currentUser?.uid.toString() != null
                        ? await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                      context); // Close the bottom sheet when tapped outside
                                },
                                child: Container(
                                  height: 250,
                                  child: Center(
                                      child: Container(
                                    width: double.infinity,
                                    height: 350,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 75, 75, 75),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'communication',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 8, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: MaterialButton(
                                                      onPressed: () async {
                                                        String url =
                                                            'http://www.google.com';
                                                        try {
                                                          if (await canLaunch(
                                                              url)) {
                                                            await launch(url);
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        } catch (error) {
                                                          print(
                                                              'Error launching URL: $error');
                                                        }
                                                      },
                                                      child: Text(
                                                        'Open website',
                                                        style: TextStyle(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 8, 0),
                                              child: Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 251, 250, 250),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    // context.pop();
                                                  },
                                                  child: Text('Link',
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontSize: 18)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 8, 0),
                                              child: Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 251, 250, 250),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    Get.back();
                                                  },
                                                  child: Text('Cancel',
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontSize: 18)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ),
                              );
                            },
                          )
                        : Get.to(() => loginWidget());
                    ;
                    // You can add any code that you want to execute after the bottom sheet is closed here.
                    // The .then((value) => setState(() {})) isn't necessary in this case.
                  },
                  child: Icon(
                    Icons.phone_rounded,
                    color: Color.fromARGB(255, 244, 241, 242),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 10,
        )
        // Text(
        //   "المدة :${dur.toString()}",
        //   style: TextStyle(fontSize: 18.0),
        // ),
        // Text(
        //   "السعر :${price.toString()}",
        //   style: TextStyle(fontSize: 18.0),
        // )
      ],
    );
    // final readButton = Column(
    //   children: [
    //    Container(
    //         padding: EdgeInsets.symmetric(vertical: 5.0),
    //         width: MediaQuery.of(context).size.width,
    //         child: MaterialButton(
    //           onPressed: () => {
    //             // Get.to(() => ShowOrderForVender(ID_DOC: widget.ID_doc))
    //             },
    //           color: Colors.pink.shade100,
    //           hoverColor: Colors.blue,
    //           child: Text(
    //             " اظهار الطلبات   ",
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 15),
    //           ),
    //         )),
    //            Container(
    //         padding: EdgeInsets.symmetric(vertical: 5.0),
    //         width: MediaQuery.of(context).size.width,
    //         child: MaterialButton(
    //           onPressed: () => {
    //           // Get.to(() => editdress(
    //           //   data:widget.data ,
    //           //   ID_doc: widget.ID_doc))
    //             },
    //           color: Colors.pink.shade100,
    //           hoverColor: Colors.blue,
    //           child: Text(
    //             "  تعديل    ",
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 15),
    //           ),
    //         ))
    //   ],
    // );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
              Get.back();
            },
          ),
        ),
        title: Text(
          'ditalsDress',
          style: TextStyle(
            color: Color.fromARGB(255, 245, 174, 174),
            fontSize: 22,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                left: 10.0,
                child: IconButton(
                  color: Color.fromARGB(255, 243, 7, 7),
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(imageUrl),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
