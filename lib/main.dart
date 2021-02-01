import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main() => runApp(TravelUI()); // Execute

/*
* Material App is:
* An application that uses material design.
* A convenience widget that wraps a number of widgets that are commonly required
* for material design applications. It builds upon a WidgetsApp by adding
* material-design specific functionality, such as AnimatedTheme and GridPaper.
* The MaterialApp configures the top-level Navigator to search for routes in
* the following order:
*   For the / route, the home property, if non-null, is used.
*   Otherwise, the routes table is used, if it has an entry for the route.
*   Otherwise, onGenerateRoute is called, if provided. It should return a non-null
*     value for any valid route not handled by home and routes.
*   Finally if all else fails onUnknownRoute is called.
* If a Navigator is created, at least one of these options must handle the / route,
* since it is used when an invalid initialRoute is specified on startup (e.g.
* by another application launching this one with an intent on Android; see
* Window.defaultRouteName).
* This widget also configures the observer of the top-level Navigator (if any)
* to perform Hero animations.
*
* --------------------------------------------
*
* MaterialApp is the starting point of your app, it tells Flutter that you are going to use Material components and follow material design in your app.
* Scaffold is used under MaterialApp, it gives you many basic functionalities, like AppBar, BottomNavigationBar, Drawer, FloatingActionButton etc.
* */

class TravelUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}
