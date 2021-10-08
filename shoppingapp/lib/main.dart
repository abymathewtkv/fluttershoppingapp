import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jesus   Christ',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: Image.asset('assets/images/hamburger.png'),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(10),
              child: Image.asset('assets/images/SEARCH.png'),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Shop ",
                  style: TextStyle(fontSize: 32, letterSpacing: 1),
                ),
                Text(
                  "Anthropologie",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: (FontWeight.bold),
                      letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: (Colors.grey[300])!,
                      spreadRadius: 1,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildColumnWithRow("1", "Element Tin Candle", "29"),
                          buildColumnWithRow("2", "Summer Candle", "23"),
                          buildColumnWithRow("3", "Winter Candle", "40"),
                          buildColumnWithRow("4", "Dummy Candle", "60"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildColumnWithRow(String img, String title, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$ $price",
            style: TextStyle(fontSize: 20),
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
        SizedBox(
          height: 5,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  FlatButton newMethod(String text, {bool isSelected = false}) {
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
      shape: StadiumBorder(),
      color: isSelected ? Colors.pink[100] : Colors.grey[300],
    );
  }
}
