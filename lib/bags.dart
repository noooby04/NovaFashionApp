import 'package:flutter/material.dart';
import 'contants.dart';
import 'package:badges/badges.dart' as badges;

class Bags extends StatefulWidget {
  const Bags({super.key});

  @override
  State<Bags> createState() => _BagsState();
}

class _BagsState extends State<Bags> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFDB3678),
          centerTitle: true,
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
                Text(
                  textAlign: TextAlign.center,
                  'Top Bags',
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
