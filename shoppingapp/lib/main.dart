

import 'package:flutter/material.dart';
import 'package:shoppingapp/detailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Shopping App',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20, color: Colors.grey[300]!, spreadRadius: 1)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainerBottomNav(Icons.person),
                buildContainerBottomNav(Icons.shopping_bag),
                buildContainerBottomNav(Icons.home, isSelected: true),
                buildContainerBottomNav(Icons.favorite),
                buildContainerBottomNav(Icons.settings),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: Image.asset('assets/images/hamburger.png'),
          actions: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.all(10),
              child: Image.asset('assets/images/SEARCH.png'),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Shop ",
                  style: TextStyle(fontSize: 32, letterSpacing: 1),
                ),
                const Text(
                  "Anthropologie",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: (FontWeight.bold),
                      letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newMethod("Home Decore", isSelected: true),
                newMethod("Bath & Body"),
                newMethod("Beauty"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: (Colors.grey[300])!,
                      spreadRadius: 1,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildColumnAtTop("Candles", isSelected: true),
                          buildColumnAtTop("Vases"),
                          buildColumnAtTop("Bins"),
                          buildColumnAtTop("Floral"),
                          buildColumnAtTop("Decor"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyCandleList(),
                      const SizedBox(
                        height: 20,
                      ),
                      LineBar(),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Holiday Special",
                              style: TextStyle(fontSize: 24),
                            ),
                            Spacer(),
                            const Text(
                              "View All",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildBottomContainer(),
                            buildBottomContainer(),
                            buildBottomContainer(),
                            buildBottomContainer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Colors.pink[100] : Colors.white,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [const BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
              : []),
      height: 50,
      width: 50,
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }

  Container buildBottomContainer() {
    return Container(
      height: 150,
      width: 230,
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: 120,
                  width: 88,
                  child: Image.asset(
                    "assets/images/candel3.jpg",
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("Cocout milk bath"),
                const Text(
                  "16 oz",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                // ignore: prefer_const_constructors
                Spacer(),
                const Text(
                  "\$ 28",
                  style: TextStyle(fontSize: 24, fontWeight: (FontWeight.w600)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildColumnAtTop(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  // ignore: deprecated_member_use
  FlatButton newMethod(String text, {bool isSelected = false}) {
    // ignore: deprecated_member_use
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 18,
        ),
      ),
      onPressed: () {
        print('Button Pressed');
      },
      shape: const StadiumBorder(),
      color: isSelected ? Colors.pink[100] : Colors.grey[300],
    );
  }
}

class LineBar extends StatelessWidget {
  const LineBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Container(
        height: 5,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class MyCandleList extends StatelessWidget {
  const MyCandleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          buildColumnWithRow("1", "Element Tin Candle", "29", context),
          buildColumnWithRow("2", "Summer Candle", "23", context),
          buildColumnWithRow("3", "Winter Candle", "40", context),
          buildColumnWithRow("4", "Dummy Candle", "60", context),
        ],
      ),
    );
  }

  GestureDetector buildColumnWithRow(
      String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailsPage(img: img, title: title,price: price,context: context,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 220,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/candel$img.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$ $price",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
