import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shopApp2/style.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:shopApp2/widgets/iconbutton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XffCDDEEC),
      bottomNavigationBar: _buildButtonNavigationButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              _topNavigationRow(),
              SizedBox(height: 10),
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  _buildMainCard(),
                  Positioned(
                    top: -10,
                    left: 58,
                    child: Image(
                      height: 190,
                      image: AssetImage('assets/watch.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              ClipShadow(
                clipper: RoundedDiagonalPathClipper(),
                boxShadow: softUiShadow,
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(36.0)),
                    color: Color(0XffCDDEEC),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        // children: iconBtns.map((item) {
                        //   //return _customIconButton(item, isSelected);
                        //   return CustomIconButton(item);
                        // }).toList(),
                        children: <Widget>[
                          CustomIconButton(
                            iconName: Icons.dehaze,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _topNavigationRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _buildRoundedIconButton(Icons.arrow_back),
      _buildRoundedIconButton(Icons.shopping_cart),
    ],
  );
}

Widget _buildRoundedIconButton(icon) {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      boxShadow: softUiShadow,
      color: Color(0XFFE8F1F9),
      shape: BoxShape.circle,
      border: Border.all(
        width: 2,
        color: Color(0XFF9D4D3),
      ),
    ),
    child: Center(
      child: Icon(
        icon,
        size: 24,
        color: Color(0Xff353151).withOpacity(.7),
      ),
    ),
  );
}

Widget _buildButtonNavigationButton() {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                '\$ 3,200',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: _preOrderButton(),
          ),
        ],
      ),
    ),
  );
}

Widget _preOrderButton() {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      gradient: activeGradient,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.indigo[300],
          spreadRadius: 6,
          blurRadius: 15,
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Pre Order',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        VerticalDivider(
          color: Colors.red,
        ),
        Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 32,
        ),
      ],
    ),
  );
}

Widget _buildMainCard() {
  return ClipShadow(
    boxShadow: softUiShadow,
    clipper: RoundedDiagonalPathClipper(),
    child: Container(
      padding: EdgeInsets.all(16),
      height: 470,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Color(0xffcddeec),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: _buildRoundedIconButton(Icons.favorite),
          ),
          _buildMainCardBottomDescription(),
        ],
      ),
    ),
  );
}

Widget _buildMainCardBottomDescription() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // children: <Widget>[
        //   CustomIconButton(
        //     iconName: Icons.directions_walk,
        //   )
        // ],
        children: iconForBtns.map((item) {
          return CustomIconButton(
            iconName: item,
          );
        }).toList(),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'NASA x Anicorn',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xFF353151),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        'Lunar Sample Return LE',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xFF353151),
          wordSpacing: 4,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        'Lorem',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipscing dolore manga aliwua. Ut enim ad minim veniam....',
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    ],
  );
}
// Widget _customIconButton(iconImage, isSelected) {
//   return Container(
//     height: 60,
//     width: 60,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: Color(0xFFEFF4F8),
//       boxShadow: softUiShadow,
//       gradient: isSelected ? activeGradient : null,
//     ),
//     child: Center(
//       child: Icon(
//         iconImage,
//         size: 30,
//         color: isSelected ? Colors.white : Colors.black,
//       ),
//     ),
//   );
// }
