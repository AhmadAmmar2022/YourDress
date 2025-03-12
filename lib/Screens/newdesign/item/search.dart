import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:yourdress/Screens/newdesign/item/details.dart';
import 'package:yourdress/Screens/newdesign/item/show.dart';

import '../../../core/constant/color.dart';

class SearchGridView extends StatefulWidget {
  @override
  _SearchGridViewState createState() => _SearchGridViewState();
}

class _SearchGridViewState extends State<SearchGridView> {
  Stream<QuerySnapshot> _usersStreamPackage =
      FirebaseFirestore.instance.collection('Dress').snapshots();

  BehaviorSubject<String> _searchQuerySubject = BehaviorSubject<String>();

  @override
  void dispose() {
    _searchQuerySubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Search',
          style: TextStyle(
            color: Color.fromARGB(255, 245, 174, 174),
            fontSize: 22,
          ),
        ),
      ),

      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: 
          
              Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      child: Container(
                        width: double.infinity,
                        child: Text("Search title or Description or Size")
                      ),
                    )
                  ],
                ),
              ),
            ),
      





        ),
        
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: 
          
              Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                           onChanged: (query) {
                        _searchQuerySubject.add(query);
                          },
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                            labelText: 'Search',
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
                              contentPadding:
                    EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            fillColor: Color.fromARGB(255, 253, 253, 253),
                         
                            prefixIcon: Icon(
                              Icons.search,
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
      





        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStreamPackage,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

              return StreamBuilder<String>(
                stream: _searchQuerySubject,
                builder: (context, searchSnapshot) {
                  String searchQuery = searchSnapshot.data ?? '';

                  List<QueryDocumentSnapshot> filteredDocuments = documents.where((doc) {
                    String title = doc['title'] ?? '';
                    String description = doc['des'] ?? '';
                    String size = doc['size'] ?? ''; 
                    return   title.toLowerCase().contains(searchQuery.toLowerCase().trim()) || 
       description.toLowerCase().contains(searchQuery.toLowerCase().trim()) || 
       size.toLowerCase().contains(searchQuery.toLowerCase().trim());
                  }).toList();

                  return GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    childAspectRatio: 0.6,
    crossAxisCount: 2,
    crossAxisSpacing: 2,
    mainAxisSpacing: 7,
  ),
  itemCount: filteredDocuments.length, // استخدم القائمة المفلترة
  itemBuilder: (context, index) {
    var document = filteredDocuments[index]; // استخدم العنصر الصحيح
    return InkWell(
      onTap: () {
        Get.to(() => details(
          data: document, // تمرير العنصر الصحيح
          ID_doc: document.id,
        ));
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                      "${document["url"]}", // استخدم العنصر الصحيح
                      height: 300,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 1, 0),
              child: Container(
                width: double.infinity,
                height: 35,
                child: Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Text(
                    "${document['title'] ?? ''}", // استخدم العنصر الصحيح
                    style: TextStyle(
                      color: Color.fromARGB(255, 37, 37, 37),
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
                  padding: const EdgeInsets.fromLTRB(1, 0, 2, 0),
                  child: Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      "Used",
                      style: TextStyle(
                        color: Color.fromARGB(255, 249, 179, 179),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 40, 0),
                  child: Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      "${document["size"]}", // استخدم العنصر الصحيح
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 56, 56),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 1, 1),
                  child: IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      child: Icon(
                        Icons.phone_enabled_outlined,
                        color: Color.fromARGB(255, 249, 248, 248),
                      ),
                      backgroundColor: AppColor.primaryColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  },
);

                },
              );
            },
          ),
        ),
      ],
    ));
  }
}

// GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                     itemCount: filteredDocuments.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: ListTile(
//                           title: Text(filteredDocuments[index]['title'] ?? ''),
//                           subtitle: Text(filteredDocuments[index]['des'] ?? ''),
//                         ),
//                       );
//                     },
//                   );