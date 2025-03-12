import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourdress/Screens/newdesign/Auth/login.dart';
import 'package:yourdress/Screens/newdesign/item/editdress.dart';
import 'package:yourdress/core/constant/color.dart';

class mydetails extends StatefulWidget {
  final data;
  final ID_doc;
  const mydetails({
    super.key,
    required this.data,
    this.ID_doc,
  });

  @override
  State<mydetails> createState() => _mydetailsState();
}

class _mydetailsState extends State<mydetails> {
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
Row(
  crossAxisAlignment: CrossAxisAlignment.start, // يجعل النص يبدأ من الأعلى
  children: [
    Text(
      'Description: ',
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    Expanded( // يجعل النص يتمدد بشكل تلقائي
      child: Text(
        des,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'El Messiri',
          color: Colors.black,
        ),
        softWrap: true, // يسمح للنص بالالتفاف تلقائيًا
        overflow: TextOverflow.visible, // يضمن ظهور كل النص دون اقتطاع
      ),
    ),
  ],
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
        

        SizedBox(
          height: 10,
        )
    
      ],
    );
    final readButton = Column(
      children: [
     
               Container(
          margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              onPressed: () => {
              Get.to(() => Editdress(
                data:widget.data ,
                id_doc: widget.ID_doc))
                },
              color: Colors.pink.shade100,
              hoverColor: Colors.blue,
              child: Text(
                "  تعديل    ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ))
      ],
    );
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
          'my dress',
          style: TextStyle(
            color: Color.fromARGB(255, 245, 174, 174),
            fontSize: 22,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
        

             topContent, 
          bottomContent,
          
         
          readButton],
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
