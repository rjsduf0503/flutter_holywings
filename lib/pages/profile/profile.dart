import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../../globalfunction.dart' as _gf;
import '../../globalclass.dart' as _gc;
import '../../components/profile/customlistview.dart' as _customlistview;

class ProfileWidget extends StatelessWidget {
  List<_gc.ItemWithUrl> badgeList = [
    _gc.ItemWithUrl("Basic", url: "assets/holywings-logo.png"),
    _gc.ItemWithUrl("Green", url: "assets/holywings-logo.png"),
    _gc.ItemWithUrl("VIP", url: "assets/holywings-logo.png"),
    _gc.ItemWithUrl("Priority", url: "assets/holywings-logo.png"),
  ];

  List<_gc.ItemWithIcon> accountList = [
    _gc.ItemWithIcon("My Profile",
        icon: Icon(Icons.account_circle), needsAuth: true),
    _gc.ItemWithIcon("My Voucher",
        icon: Icon(Icons.confirmation_number), needsAuth: true),
    _gc.ItemWithIcon("Setting", icon: Icon(Icons.settings)),
  ];

  List<_gc.ItemWithIcon> othersList = [
    _gc.ItemWithIcon("Contact Us",
        icon: Icon(Icons.contact_phone), needsRouting: false),
    _gc.ItemWithIcon("Help",
        icon: Icon(Icons.help_outline), needsRouting: false),
    _gc.ItemWithIcon("Rate Holywings App",
        icon: Icon(Icons.thumb_up, color: Colors.orange[200]),
        needsRouting: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              Icon(Icons.account_circle),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015),
                              Text('Hi, HolyPeople',
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.005),
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
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderThemeData(
                          disabledActiveTrackColor: Colors.orange[200],
                          disabledInactiveTrackColor: Colors.grey[600],
                          trackHeight: 20,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 0.0),
                          // trackShape: SliderTrackShape(style: ),
                        ),
                        child: Slider(
                          value: 20,
                          onChanged: null,
                          min: 0,
                          max: 100,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: badgeList.asMap().entries.map((item) {
                          return InkWell(
                            onTap: (() {
                              _gf.handleRouting(context, 'Membership Benefit',
                                  item.value.needsAuth);
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /* Under Background */
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Center(
            child: Text('Please login to see this information',
                style: TextStyle(fontSize: 14)),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Account',
              style: TextStyle(fontSize: 14, color: Colors.orange[200]),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          _customlistview.CustomListView(accountList),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Others',
              style: TextStyle(fontSize: 14, color: Colors.orange[200]),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          _customlistview.CustomListView(othersList),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // ),
        ],
      ),
    );
  }
}
