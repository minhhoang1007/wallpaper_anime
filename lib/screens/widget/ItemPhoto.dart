import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper/wallpaper.dart';

class ItemPhotoScreen extends StatefulWidget {
  String img;
  ItemPhotoScreen({this.img, Key key}) : super(key: key);

  @override
  _ItemPhotoScreenState createState() => _ItemPhotoScreenState();
}

class _ItemPhotoScreenState extends State<ItemPhotoScreen> {
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";
  Stream<String> progressString;
  String res;
  bool downloading = false;
  String path = "";
  var result = "Waiting to set wallpaper";
  void setwallpaper() {
    progressString = Wallpaper.ImageDownloadProgress(widget.img);
    progressString.listen((data) {
      print("listen");
      setState(() {
        res = data;
        downloading = true;
      });
      print("DataReceived: " + data);
    }, onDone: () async {
      home = await Wallpaper.homeScreen();
      setState(() {
        downloading = false;
        home = home;
      });
      print("Task Done");
      // }, onError: () {
      //   setState(() {
      //     downloading = false;
      //   });
      //   print("Some Error");
    });
    Fluttertoast.showToast(
      msg: "Set Wallpaper Complete",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      fontSize: 16,
    );
  }

  //Save
  void move() {
    rootBundle.load(widget.img).then((content) async {
      Directory dic = await getExternalStorageDirectory();
      // print(dic.absolute.path);
      path = '${dic.absolute.path}/img.jpg';
      File newFile = File('${dic.absolute.path}/img.jpg');
      newFile.writeAsBytesSync(content.buffer.asUint8List());
      // visionImage = FirebaseVisionImage.fromFile(newFile);
      // _runAnalysis();
      Fluttertoast.showToast(
        msg: "Save Complete",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        fontSize: 16,
      );
    });
  }

  //Share
  Future<void> _shareImage() async {
    try {
      final ByteData bytes = await rootBundle.load(widget.img);
      await Share.file(
          'esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png',
          text: 'My optional text.');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.img),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        move();
                        print("ok");
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/icons/download.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Reloading...");
                        setwallpaper();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/icons/wallpaper.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _shareImage();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/icons/share.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<File> file(String filename) async {
    print("abc");
    Directory dir = await getApplicationDocumentsDirectory();
    String pathName = join(dir.path, filename);
    return File(pathName);
  }
}
