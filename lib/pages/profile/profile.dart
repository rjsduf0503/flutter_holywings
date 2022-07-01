import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../../globalfunction.dart' as _gf;

class Item {
  String url, name;
  Item({required this.url, required this.name});
}

class ProfileWidget extends StatelessWidget {
  List<Item> itemList = [
    Item(url: "assets/holywings-logo.png", name: "Basic"),
    Item(url: "assets/holywings-logo.png", name: "Green"),
    Item(url: "assets/holywings-logo.png", name: "VIP"),
    Item(url: "assets/holywings-logo.png", name: "Priority"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage("assets/sample2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015),
                            Text('Hi, HolyPeople',
                                style: TextStyle(fontSize: 12)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 12),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.1),
                                  primary: Colors.orange[200],
                                  onPrimary: Colors.black,
                                ),
                                onPressed: (() {
                                  _gf.showLoginBottomSheet(context);
                                }),
                                child: Text("Login"))
                          ],
                        ),
                      ),
                      // bar
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: MediaQuery.of(context).size.height * 0.01,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: itemList.asMap().entries.map((item) {
                    return InkWell(
                      onTap: (() {
                        _gf.handleBadgeClick(context, 'Membership Benefit');
                      }),
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          Image.asset(
                            item.value.url,
                            fit: BoxFit.contain,
                            width: 64,
                            height: 64,
                          ),
                          Text(item.value.name,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        /* Under Background */
        Center(
          child: Text('Please login to see this information',
              style: TextStyle(fontSize: 14)),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Text('Account',
              style: TextStyle(fontSize: 14, color: Colors.orange[200])),
        )
      ],
    );
    // return ListView(children: [
    //   Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: <Widget>[
    //       Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage("assets/sample1.jpeg"),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         child: Text('hi') /* add child content here */,
    //       ),
    //     ],
    //   ),
    // ]);
  }
}
