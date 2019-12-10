import 'package:flutter/material.dart';
import 'package:hinh_nen_anime/screens/widget/CustomDialog.dart';

class GirlsScreen extends StatefulWidget {
  GirlsScreen({Key key}) : super(key: key);

  @override
  _GirlsScreenState createState() => _GirlsScreenState();
}

class _GirlsScreenState extends State<GirlsScreen> {
  List<String> items = [
    "assets/girls/girl1.jpg",
    "assets/girls/girl2.jpg",
    "assets/girls/girl3.jpg",
    "assets/girls/girl4.jpg",
    "assets/girls/girl5.jpg",
    "assets/girls/girl6.png",
    "assets/girls/girl7.jpg",
    "assets/girls/girl8.png",
    "assets/girls/girl9.jpg",
    "assets/girls/girl10.jpg",
    "assets/girls/girl11.png",
    "assets/girls/girl12.jpg",
    "assets/girls/girl13.jpg",
    "assets/girls/girl14.jpg",
    "assets/girls/girl15.jpg",
    "assets/girls/girl16.jpg",
    "assets/girls/girl17.jpg",
    "assets/girls/girl18.jpg",
    "assets/girls/girl19.jpg",
    "assets/girls/girl20.jpg",
    "assets/girls/girl21.jpg",
    "assets/girls/girl22.jpg",
    "assets/girls/girl23.jpg",
    "assets/girls/girl24.jpg",
    "assets/girls/girl25.jpg",
    "assets/girls/girl26.jpg",
    "assets/girls/girl27.jpg",
    "assets/girls/girl28.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 1.3;
    final double itemWidth = size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg3.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03),
                      child: Text('Anime Girls Online',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/icons/share.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialog());
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              "assets/icons/love.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Image.asset(
                            items[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
