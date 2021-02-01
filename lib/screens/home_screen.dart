import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // To make icon selectable, we create a variable recording what is selected
  int _selectedIndex = 0;
  int _currentTab = 0;
  // Create list of icons
  List<IconData> _icons =[ // Make it local
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  //Create function for Icon building
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap:(){
        setState(() {
          _selectedIndex = index;
          // Add more method here for displaying differen tiles
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          // If selected index is index then use accent color else use gray
          color: _selectedIndex == index ? Theme.of(context).accentColor : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index], // We use the above defined icon
          size:25.0,
          // If selected index is index then use accent color else use gray
          color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0, right:120.0),
              child: Text(
                  "What you would like to find?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0), // add padding between lines
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              // Instead of hard coding the index, we use as map that converts list to dictionary like
              // and input entries, where it is from mapping _buildIcon key
              // this is similiar to python inputting the length of list into a loop
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height:20.0),
            DestinationCarousel(),
            SizedBox(height:20.0),
            HotelCarousel(),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
              ),
              title: SizedBox.shrink()
          ),
        ]
      ),
    );
  }
}
