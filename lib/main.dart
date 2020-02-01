import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'UI/FormCard.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSelectedOne = false;
  bool _isSelectedTwo = false;

  void _radioOne() {
    setState(() {
      _isSelectedOne = !_isSelectedOne;
    });
  }

  void _radioTwo() {
    setState(() {
      _isSelectedTwo = !_isSelectedTwo;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 20.0,
        height: 20.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 3.0, color: Colors.purple)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.purple),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 2.5,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1284, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Image.asset(
                    "assets/handshake_2.png"), //Image background on top
              ),
              Expanded(
                child: Container(),
              ),
              // Image.asset("assets/image_02.png")  //Image background at the bottom
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(50), right: ScreenUtil.getInstance().setWidth(50), top: ScreenUtil.getInstance().setHeight(50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/circle_logo.png",
                        width: ScreenUtil.getInstance().setWidth(90),
                        height: ScreenUtil.getInstance().setHeight(90),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 58.0),
                      ),
                      // Text("WELCOME ",
                      //     style: TextStyle(
                      //         fontFamily: "Poppins-Bold",
                      //         fontSize: ScreenUtil.getInstance().setSp(50),
                      //         letterSpacing: 0.2,
                      //         fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  FormCard(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(120)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 12.0,
                              ),
                              GestureDetector(
                                onTap: _radioOne,
                                child: radioButton(_isSelectedOne),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "I am a Freelancer",
                                style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(25),
                                  fontFamily: "Poppins-Medium",
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                                height: ScreenUtil.getInstance().setHeight(16),),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 12.0,
                              ),
                              GestureDetector(
                                onTap: _radioTwo,
                                child: radioButton(_isSelectedTwo),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Actively Job Hunting",
                                style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(25),
                                  fontFamily: "Poppins-Medium",
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(250),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(15.0),
                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Color(0xFF6078ea).withOpacity(.3),
                              //       offset: Offset(0.0, 8.0),
                              //       blurRadius: 8.0)
                              // ]
                              ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text("NEXT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 20,
                                        letterSpacing: 2.5)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(60),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text("My Profile",
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
