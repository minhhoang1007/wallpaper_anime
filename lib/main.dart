import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hinh_nen_anime/screens/HomeScreen.dart';
import 'package:hinh_nen_anime/screens/widget/BottomNavBarProvider.dart';
import 'package:provider/provider.dart';

void main() {
  

   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Admob.initialize("ca-app-pub-3940256099942544~3347511713");
    return MultiProvider(
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
      providers: [
        ChangeNotifierProvider(
          builder: (_) => BottomNavBarProvider(),
        ),
      ],
    );
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: HomeScreen(),
  //     debugShowCheckedModeBanner: false,
  //   );
  // }
}
