import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/home/slider.dart' as Slider;
import '../../components/home/gridview.dart' as Gridview;
import '../../components/home/favoriteoutlet.dart' as Outlet;
import '../../components/home/userinfo.dart' as Userinfo;
import '../../globalfunction.dart' as _gf;

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeHeaderLayout(),
            HomeBodyLayout(),
          ],
        ),
      ),
    ]);
  }
}

class HomeHeaderLayout extends StatelessWidget {
  const HomeHeaderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[800],
      child: SizedBox(
        height: 50.0,
        child: Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // _gf.openLoginBottomSheet();
                  _gf.showLoginBottomSheet(context);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, HolyPeople',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Click to login',
                      style: TextStyle(
                        color: Colors.amber[300],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: (() {
                  _gf.handleGridClick(context, 'Notification');
                }),
                icon: Icon(
                  Icons.notifications,
                  size: 24,
                ),
                color: Colors.amber[300],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeBodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider.SliderComponent(),
        Userinfo.UserInfoComponent(),
        Gridview.GridViewComponent(),
        Outlet.OutletComponent(),
        SizedBox(height: 40),
      ],
    );
  }
}
