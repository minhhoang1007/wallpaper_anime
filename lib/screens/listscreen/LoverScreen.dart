import 'package:flutter/material.dart';
import 'package:hinh_nen_anime/screens/widget/CustomDialog.dart';
import 'package:hinh_nen_anime/screens/widget/ItemPhoto.dart';

class LoverScreen extends StatefulWidget {
  LoverScreen({Key key}) : super(key: key);

  @override
  _LoverScreenState createState() => _LoverScreenState();
}

class _LoverScreenState extends State<LoverScreen> {
  List<String> items = [
    "assets/lovers/love1.jpg",
    "assets/lovers/love2.jpg",
    "assets/lovers/love3.jpg",
    "assets/lovers/love4.jpg",
    "assets/lovers/love5.jpg",
    "assets/lovers/love6.jpg",
    "assets/lovers/love7.jpg",
    "assets/lovers/love8.jpg",
    "assets/lovers/love9.jpg",
    "assets/lovers/love10.jpg",
    "assets/lovers/love11.jpg",
    "assets/lovers/love12.jpg",
    "assets/lovers/love13.jpg",
    "assets/lovers/love14.jpg",
    "assets/lovers/love15.jpg",
    "assets/lovers/love16.jpg",
    "assets/lovers/love17.jpg",
    "assets/lovers/love18.jpg",
    "assets/lovers/love19.jpg",
    "assets/lovers/love20.jpg",
    "assets/lovers/love21.jpg",
    "assets/lovers/love22.jpg",
    "assets/lovers/love23.jpg",
    "assets/lovers/love24.jpg",
    "assets/lovers/love25.jpg",
    "assets/lovers/love26.jpg",
    "assets/lovers/love27.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 1.2;
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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03),
                      child: Text('Anime Lovers Online',
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemPhotoScreen(
                              img: items[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
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
