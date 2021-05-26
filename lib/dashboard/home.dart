import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tjakep/profile/profile.dart';
import 'package:tjakep/quiz/quiz.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeScreen extends StatelessWidget {
  Widget menuIcon({
    @required Size deviceSize,
    @required String text,
    @required IconData icon,
    @required BuildContext context,
    @required Widget screen,
  }) {
    return Container(
      height: 60.0,
      width: deviceSize.width / 5,
      padding: EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: GestureDetector(
              child : Icon(
                icon,
                color: Colors.grey[100],
              ),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => screen)); print("test");}
              )
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }

  Widget mainMenuIcon({
    @required Size deviceSize,
    @required String text,
    @required String src, 
  }) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              child: Image.asset(src),
              foregroundColor: Colors.red,
              backgroundColor: Colors.white,
            ),
            width: 80.0,
            height: 80.0,
            padding: EdgeInsets.all(2.0), // borde width
            decoration: BoxDecoration(
              color: Colors.grey[200], // border color
              shape: BoxShape.circle,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget topMenu({
    @required Size deviceSize,
  }) {
    return Row(
      children: <Widget>  [
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.home,
          text: "Home",
          //screen
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.question_answer,
          text: "Quiz",
          screen: Quiz(),
          
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.schedule,
          text: "Schedule",
          //screen
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.school,
          text: "Grades",
          //screen
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.person,
          text: "Profile",
          screen: ProfileApp()
        ),
      ],
    );
  }

  Widget balanceInfo() {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Halo",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: <Widget>[
                  Container(
                    child: 
                    Text(
                    "KAFKHA",
                    style: TextStyle(
                      color: Color(0xffd0993c),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget stackedMenuIcon({
    @required Size deviceSize,
    @required String src,
    @required String text,
    @required BuildContext context,
    @required Widget screen,
  }) {
    return Container(
      width: (deviceSize.width - 45) / 3,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 0.0),
            child: GestureDetector(
              child: Image.asset(src, height: 60, width: 60,),
              onTap: () async {
                String cameraScanResult = await scanner.scan();
                },
            )
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget stackedMenuSeparator() {
    return Container(
      height: double.infinity,
      width: 2.0,
      color: Colors.grey[300],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa20d1a),
        toolbarHeight: 290,
        elevation: 0.0,
        title: Container(
          child: Image.asset("res/images/tjakep-landscape.png", height: 100, width: 150),
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.bell),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(250.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  topMenu(
                    deviceSize: deviceSize,
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey[500],
                  ),
                  balanceInfo(),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 95.0,
                        color: Color(0xFFb80f1d),
                      ),
                      Positioned(
                        top: 50.0,
                        child: Container(
                          height: 45.0,
                          width: deviceSize.width,
                          color: Color(0xfffafafa),
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        left: 20.0,
                        child: Card(
                          child: Container(
                            height: 80.0,
                            width: deviceSize.width - 40,
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                stackedMenuIcon(
                                  src: "res/images/abs-m.png",
                                  text: "Absen masuk",
                                  deviceSize: deviceSize,
                                  
                                ),
                                stackedMenuSeparator(),
                                stackedMenuIcon(
                                  src: "res/images/abs-p.png",
                                  text: "Absen pulang",
                                  deviceSize: deviceSize,
                                  
                                ),
                                stackedMenuSeparator(),
                                stackedMenuIcon(
                                  src: "res/images/history-abs.png",
                                  text: "History",
                                  deviceSize: deviceSize,
                                  
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        mainMenuIcon(
                          deviceSize: deviceSize,
                          src: "res/images/KK1.png",
                          text: "KK1",
                        ),
                        mainMenuIcon(
                          deviceSize: deviceSize,
                          src: "res/images/KK2.png",
                          text: "KK2",
                        ),
                        mainMenuIcon(
                          deviceSize: deviceSize,
                          src: "res/images/KK3.png",
                          text: "KK3",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        mainMenuIcon(
                          deviceSize: deviceSize,
                          src: "res/images/KK4.png",
                          text: "KK4",
                        ),
                        mainMenuIcon(
                          deviceSize: deviceSize,
                          src: "res/images/KK5.png",
                          text: "KK5",
                        ),
                        mainMenuIcon(
                          deviceSize: deviceSize,
                          src: "res/images/lihat_semua.png",
                          text: "Lihat Semua",
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      height: 140.0,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Card(
                            child: Container(
                              width: 340.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("res/images/banner2.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: 350.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("res/images/banner1.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
