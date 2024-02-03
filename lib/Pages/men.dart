import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/personalinfo.dart';

class Men extends StatefulWidget {
  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> {
  final List<Shoe> shoes = [
    Shoe(
        name: 'Ndure Running Shoe',
        price: 3500,
        image: 'assets/images/menshoes.webp'),
    Shoe(
        name: 'Ndure Black Shoe',
        price: 4000,
        image: 'assets/images/menshoes1.webp'),
    Shoe(
        name: 'Nike Dunk Low Retro',
        price: 15000,
        image: 'assets/images/menshoes2.png'),
    Shoe(
        name: 'Nike Air Max',
        price: 20000,
        image: 'assets/images/menshoes3.png'),
    Shoe(
        name: 'Nike Air Force 1',
        price: 40000,
        image: 'assets/images/menshoes4.png'),
    Shoe(
        name: 'Nike React Element',
        price: 45000,
        image: 'assets/images/menshoes5.png'),
    Shoe(
        name: 'Nike Zoom Pegasus',
        price: 10000,
        image: 'assets/images/menshoes6.png'),
    Shoe(
        name: 'Nike Free RN',
        price: 46500,
        image: 'assets/images/menshoes7.png'),
    Shoe(name: 'Nike Shox', price: 34500, image: 'assets/images/menshoes8.png'),
    Shoe(
        name: 'Nike LeBron',
        price: 32000,
        image: 'assets/images/menshoes9.png'),
    Shoe(
        name: 'Nike Kyrie',
        price: 13500,
        image: 'assets/images/menshoes10.png'),
    Shoe(
        name: 'Nike SB Dunk',
        price: 35000,
        image: 'assets/images/menshoes11.png'),
    Shoe(
        name: 'Nike Blazer',
        price: 22000,
        image: 'assets/images/menshoes12.png'),
  ];

  TextEditingController _searchController = TextEditingController();
  List<Shoe> _filteredShoes = [];

  @override
  void initState() {
    super.initState();
    _filteredShoes.addAll(shoes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Men Shoes",
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _searchController,
              onChanged: (value) {
                _filterShoes(value);
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: _filteredShoes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showShoeDetails(context, _filteredShoes[index]);
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                _filteredShoes[index].image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_filteredShoes[index].name,
                                      style: TextStyle(color: Colors.black)),
                                  Text(
                                      '\PKR ${_filteredShoes[index].price.toString()}',
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ]));
  }

  void _filterShoes(String query) {
    _filteredShoes.clear();
    _filteredShoes.addAll(shoes.where(
        (shoe) => shoe.name.toLowerCase().contains(query.toLowerCase())));
    setState(() {});
  }

  void _showShoeDetails(BuildContext context, Shoe shoe) {
    int numberOfShoes = 1;
    String size = '39';
    List<String> availableSizes = [
      '39',
      '40',
      '41',
      '42',
      '43',
      '44',
      '45',
      '46'
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: Text(shoe.name, style: TextStyle(color: Colors.white)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    shoe.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8.0),
                  Text('Price: \PKR ${shoe.price.toString()}',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    value: size,
                    onChanged: (String? newSize) {
                      setState(() {
                        size = newSize!;
                      });
                    },
                    items: availableSizes.map((String size) {
                      return DropdownMenuItem<String>(
                        value: size,
                        child: Text('Size $size',
                            style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    style: TextStyle(color: Colors.white),
                    dropdownColor: Colors.black,
                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Number of Shoes: $numberOfShoes',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numberOfShoes = numberOfShoes + 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Icon(Icons.add, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (numberOfShoes > 1) {
                      setState(() {
                        numberOfShoes = numberOfShoes - 1;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Icon(Icons.remove, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _addToCart(shoe, numberOfShoes, size);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to the cart'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  child: Text('Add to Cart',
                      style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    _buyNow(shoe, numberOfShoes, size);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  child: Text('Buy Now', style: TextStyle(color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _addToCart(Shoe shoe, int numberOfShoes, String size) async {
    await FirebaseFirestore.instance.collection('Items').add({
      'sname': shoe.name,
      'sprice': shoe.price,
      'simage': shoe.image,
      'squantity': numberOfShoes,
      'size': size,
    });
  }

  void _buyNow(Shoe shoe, int numberOfShoes, String size) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalInfoPage(
            shoe: shoe,
            numberOfShoes: numberOfShoes,
            size: size,
          ),
        ));
    print('Buying $numberOfShoes ${shoe.name}(s) now!');
  }
}

class Shoe {
  final String name;
  final int price;
  final String image;

  Shoe({required this.name, required this.price, required this.image});
}
