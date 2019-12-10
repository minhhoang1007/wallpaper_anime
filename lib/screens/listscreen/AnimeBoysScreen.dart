import 'package:flutter/material.dart';
import 'package:hinh_nen_anime/screens/listscreen/WallpaperScreen.dart';
import 'package:hinh_nen_anime/screens/widget/CustomDialog.dart';
import 'package:hinh_nen_anime/screens/widget/ItemPhoto.dart';

class AnimeBoysScreen extends StatefulWidget {
  AnimeBoysScreen({Key key}) : super(key: key);

  @override
  _AnimeBoysScreenState createState() => _AnimeBoysScreenState();
}

class _AnimeBoysScreenState extends State<AnimeBoysScreen> {
  List<String> items = [
    "assets/boys/boy1.jpg",
    "assets/boys/boy2.jpg",
    "assets/boys/boy3.jpg",
    "assets/boys/boy4.jpg",
    "assets/boys/boy5.jpg",
    "assets/boys/boy6.jpg",
    "assets/boys/boy7.jpg",
    "assets/boys/boy8.jpg",
    "assets/boys/boy9.jpg",
    "assets/boys/boy10.jpg",
    "assets/boys/boy11.jpg",
    "assets/boys/boy12.jpg",
    "assets/boys/boy13.jpg",
    "assets/boys/boy14.jpg",
    "assets/boys/boy15.jpg",
    "assets/boys/boy16.jpg",
    "assets/boys/boy17.jpg",
    "assets/boys/boy18.jpg",
    "assets/boys/boy19.png",
    "assets/boys/boy20.png",
    "assets/boys/boy21.png",
    "assets/boys/boy22.jpg",
    "assets/boys/boy23.jpg",
    "assets/boys/boy24.jpg",
    "assets/boys/boy25.jpg",
    "assets/boys/boy26.jpg",
    "assets/boys/boy27.jpg",
    "assets/boys/boy28.jpg",
  ];

  // BannerAd createBannerAd() {
  //   return BannerAd(
  //       adUnitId: BannerAd.testAdUnitId,
  //       //Change BannerAd adUnitId with Admob ID
  //       size: AdSize.banner,
  //       targetingInfo: targetingInfo,
  //       listener: (MobileAdEvent event) {
  //         print("BannerAd $event");
  //       });
  // }

  @override
  void initState() {
    //FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    //Change appId With Admob Id
    // _bannerAd = createBannerAd()
    //   ..load()
    //   ..show();
    super.initState();
  }

  // @override
  // void dispose() {
  //   //_bannerAd.dispose();
  //   _interstitialAd.dispose();
  //   super.dispose();
  // }

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
                      child: Text('Anime Boys Online',
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
