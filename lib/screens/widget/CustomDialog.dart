import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({Key key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset(
                  "assets/images/ic5_144.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("How was your experience ",
                        style: TextStyle(fontSize: 18)),
                    Text("with us?", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/icons/ic_star_black.png",
                      fit: BoxFit.fill, color: Colors.grey[500]),
                ),
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/icons/ic_star_black.png",
                        fit: BoxFit.fill, color: Colors.grey[500])),
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/icons/ic_star_black.png",
                        fit: BoxFit.fill, color: Colors.grey[500])),
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/icons/ic_star_black.png",
                        fit: BoxFit.fill, color: Colors.grey[500])),
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/icons/ic_star_black.png",
                        fit: BoxFit.fill, color: Colors.grey[500])),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text("Not Now",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
