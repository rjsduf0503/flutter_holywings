import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Item {
  String url, name;
  Item({required this.url, required this.name});
}

class SliderComponent extends StatefulWidget {
  const SliderComponent({Key? key}) : super(key: key);

  @override
  _SliderComponentState createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  int pageIndex = 0;

  List<Item> imageList = [
    Item(url: "assets/sample1.jpeg", name: "sample1"),
    Item(url: "assets/sample2.jpeg", name: "sample2"),
    Item(url: "assets/sample3.jpeg", name: "sample3"),
    Item(url: "assets/sample4.jpeg", name: "sample4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
            items: imageList.asMap().entries.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      item.value.url,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        CarouselIndicator(
          count: imageList.length,
          index: pageIndex,
          width: 8,
          height: 8,
          activeColor: Colors.amber.shade300,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
