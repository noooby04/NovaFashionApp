import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contants.dart';
import 'package:badges/badges.dart' as badges;

class Clothes extends StatefulWidget {
  const Clothes({super.key});

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  String dropdownvalue = 'One';
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
                  'Top Clothes',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                Center(
                  child: DropdownButton<String>(
                    value: dropdownvalue,
                    underline: Container(
                      color: Colors.white,
                    ),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownvalue = newvalue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'One',
                        child: Text('FILTERS'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Two',
                        child: Text('Low To High'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Three',
                        child: Text('Brands'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Four',
                        child: Text('Colour'),
                      ),
                    ],
                    icon: Icon(Icons.menu),
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
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Gridview(
                                      image: Constants.clothImages[index],
                                      text: Constants.clothdetail.keys
                                          .elementAt(index),
                                      price: Constants.clothdetail.values
                                          .elementAt(index),
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'left',
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: photoframe(
                                      image: Constants.clothImages[index],
                                      title: Constants.clothdetail.keys
                                          .elementAt(index),
                                      price: Constants.clothdetail.values
                                          .elementAt(index)),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Gridview(
                                      image: Constants.clothImages[index],
                                      text: Constants.clothdetail.keys
                                          .elementAt(index),
                                      price: Constants.clothdetail.values
                                          .elementAt(index),
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: 'right',
                                child: photoframe(
                                    image: Constants.clothImages[index],
                                    title: Constants.clothdetail.keys
                                        .elementAt(index),
                                    price: Constants.clothdetail.values
                                        .elementAt(index)),
                              ),
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

//--------------------------------------------------------------------------------------------------------

class Gridview extends StatefulWidget {
  Gridview({
    required this.image,
    required this.text,
    required this.price,
  });
  String image;
  String text;
  String price;

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Hero(
              tag: 'left',
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Novastyle',
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Price: ${widget.price}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Novastyle',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _decrementQuantity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.remove),
                ),
              ),
              SizedBox(width: 20),
              Text(
                '$_quantity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: _incrementQuantity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDC3678),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                minimumSize: Size(300, 50),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------------------------------------------
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
