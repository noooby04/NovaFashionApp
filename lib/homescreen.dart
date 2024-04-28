import 'dart:ffi';
import 'clothes.dart';
import 'bags.dart';
import 'historypage.dart';
import 'profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'contants.dart';

List<Widget> screens = [
  Historypage(),
  Actualhome(),
  Profilepage(),
];

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentindex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFF7CAD8),
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          selectedItemColor: Color(0xFFDB3678),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------------
//ACTUAL HOME

class Actualhome extends StatefulWidget {
  const Actualhome({super.key});

  @override
  State<Actualhome> createState() => _ActualhomeState();
}

class _ActualhomeState extends State<Actualhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFDB3678),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            iconSize: 25,
          ),
          title: Text(
            'NOVA',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: 'Novastyle',
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: badges.Badge(
                  badgeContent: Text(
                    '3',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bags(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/bags.png'),
                            radius: 40,
                          ),
                        ),
                        Text(
                          'bags',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Novastyle'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Clothes(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/tshirt.png'),
                            radius: 40,
                          ),
                        ),
                        Text(
                          'clothes',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Novastyle'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/shoes.png'),
                            radius: 40,
                          ),
                        ),
                        Text(
                          'shoes',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Novastyle'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'New Collection',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'with',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '15%',
                      style: TextStyle(
                          color: Color(0xFFE23377),
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'discount',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage("images/model.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60, left: 60),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFFE23376), // Background color
                            ),
                            onPressed: () {},
                            child: Text(
                              'Shop Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Top Sales',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      mainAxisSpacing:
                          20.0, // Vertical spacing between grid items
                      crossAxisSpacing:
                          20.0, // Horizontal spacing between grid items
                      childAspectRatio: 0.8, // Aspect ratio of each grid item
                    ),
                    itemCount: Constants.productImages
                        .length, // Number of items in the grid (in this case, 2 rows)
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(
                        parent:
                            ClampingScrollPhysics()), // Disable scrolling in the grid
                    itemBuilder: (BuildContext context, int index) {
                      // Return a row containing two photo frames
                      return index.isOdd
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: photoframe(
                                  image: Constants.productImages[index],
                                  title: Constants.productdetails.keys
                                      .elementAt(index),
                                  price: Constants.productdetails.values
                                      .elementAt(index)),
                            )
                          : photoframe(
                              image: Constants.productImages[index],
                              title: Constants.productdetails.keys
                                  .elementAt(index),
                              price: Constants.productdetails.values
                                  .elementAt(index));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class photoframe extends StatelessWidget {
  photoframe({
    required this.image,
    required this.title,
    required this.price,
  });
  String image;
  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          textAlign: TextAlign.start,
          title,
          style: TextStyle(fontFamily: 'Novastyle', fontSize: 20),
        ),
        Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
