import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

class BuyerPage extends StatefulWidget {
  @override
  _BuyerPageState createState() => _BuyerPageState();
}

class _BuyerPageState extends State<BuyerPage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _products = [];
  bool _loadingProducts = true;
  int _per_page = 3;
  DocumentSnapshot _lastDocument;
  ScrollController _scrollcontroller = ScrollController();
  bool _gettingMoreProducts = false;
  bool _moreProductsAvailable = true;

  _getProducts() async {
    Query query = _firestore
        .collection("test")
        .orderBy("Name")
        .startAfter([_lastDocument]).limit(_per_page);

    setState(() {
      _loadingProducts = true;
    });

    QuerySnapshot querySnapshot = await query.getDocuments();
    _products = querySnapshot.documents;
    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];

    setState(() {
      _loadingProducts = false;
    });
  }

  _getMoreProducts() async {
    print("More products are loading");

    if (_moreProductsAvailable == false) {
      print('No more products');
      return;
    }

    if (_gettingMoreProducts == true) {
      return;
    }
    _gettingMoreProducts = true;
    Query query = _firestore
        .collection("test")
        .orderBy("Name")
        .startAfter([_lastDocument.data()['Name']]).limit(_per_page);

    QuerySnapshot querySnapshot = await query.getDocuments();
    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    _products.addAll(querySnapshot.documents);

    if (querySnapshot.documents.length > _per_page) {
      _moreProductsAvailable = false;
    }
    setState(() {});
    _gettingMoreProducts = false;
  }

  @override
  void initState() {
    super.initState();
    _getProducts();

    _scrollcontroller.addListener(() {
      double maxScroll = _scrollcontroller.position.maxScrollExtent;
      double currentScroll = _scrollcontroller.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;

      if (maxScroll - currentScroll <= delta) {
        _getMoreProducts();
      }
    });
  }

  String dropdownValue = 'Two';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center, //Text('Products'),
              children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.menu),
              iconSize: 28,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              // underline: Container(
              //   height: 2,
              //   color: Colors.deepPurpleAccent,
              // ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['', 'Two', 'Three', 'Four', 'Five', '']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ])),
      body: _loadingProducts == true
          ? Container(
              child: Center(
              child: Text('Loading...'),
            ))
          : Container(
              child: _products.length == 0
                  ? Center(
                      child: Text('No Products to display'),
                    )
                  : ListView.builder(
                      controller: _scrollcontroller,
                      itemCount: _products.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Ink.image(
                                    image: NetworkImage(
                                        _products[index].data()['image']),
                                    height: 210,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(16).copyWith(bottom: 0),
                                child: Text(
                                  _products[index].data()['Name'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                        // return buildImageInteractionCard();
                        // return ListTile(
                        //   leading: CircleAvatar(
                        //     child: ClipOval(
                        //       child: Image.network(
                        //           _products[index].data()['image']),
                        //     ),
                        //   ),
                        //   title: Text(_products[index].data()['Name']),
                        // );
                      },
                    ),
            ),
    );
  }
}
