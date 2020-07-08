import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:longzongbuy/Home/common/widgets/ThreeDimensionalDrawer.dart';
import 'package:longzongbuy/Home/home.dart';
import 'package:longzongbuy/Home/screens/ItemDetails/ItemDetails.dart';
import 'package:longzongbuy/Home/screens/ItemDetails/bloc/itemdetails_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ItemDetails.route:
              return PageRouteBuilder(
                  pageBuilder: (context, _, __) => BlocProvider(
                        create: (context) => ItemDetailsBloc(),
                        child: ItemDetails(settings.arguments),
                      ),
                  transitionDuration: Duration(milliseconds: 300),
                  transitionsBuilder: (_, anim, __, child) =>
                      FadeTransition(opacity: anim, child: child));

            default:
              return MaterialPageRoute(
                  settings: settings, builder: (context) => HomePage());
          }
        },
        home: HomePage());
  }
}
