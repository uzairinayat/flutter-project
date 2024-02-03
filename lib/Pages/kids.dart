import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swagkicks/Pages/personalinfo4kid.dart';

class Kids extends StatefulWidget {
  @override
  State<Kids> createState() => _KidsState();
}

class _KidsState extends State<Kids> {
  final List<KShoe> shoes = [
    KShoe(
        name: 'Nike Kids Air Max 270',
        price: 7999,
        image: 'assets/images/kidshoe.png'),
    KShoe(
        name: 'Nike Kids Free RN',
        price: 9500,
        image: 'assets/images/kidshoe1.png'),
    KShoe(
        name: 'Nike Kids Pegasus',
        price: 10000,
        image: 'assets/images/kidshoe2.png'),
    KShoe(
        name: 'Nike Kids React Element',
        price: 12500,
        image: 'assets/images/kidshoe3.png'),
    KShoe(
        name: 'Nike Kids Air Force 1',
        price: 15000,
        image: 'assets/images/kidshoe4.png'),
    KShoe(
        name: 'Nike Kids Renew Run',
        price: 17500,
        image: 'assets/images/kidshoe5.png'),
    KShoe(
        name: 'Nike Kids Downshifter 10',
        price: 13000,
        image: 'assets/images/kidshoe6.png'),
    KShoe(
        name: 'Nike Kids Tanjun',
        price: 7500,
        image: 'assets/images/kidshoe7.png'),
    KShoe(
        name: 'Nike Kids Star Runner',
        price: 8500,
        image: 'assets/images/kidshoe8.png'),
    KShoe(
        name: 'Nike Kids Flex Contact',
        price: 16000,
        image: 'assets/images/kidshoe9.png'),
    KShoe(
        name: 'Nike Kids Revolution 5',
        price: 16000,
        image: 'assets/images/kidshoe10.png'),
    KShoe(
        name: 'Nike Kids Renew Elevate',
        price: 15500,
        image: 'assets/images/kidshoe11.png'),
    KShoe(
        name: 'Nike Kids Revolution 6',
        price: 20000,
        image: 'assets/images/kidshoe12.png'),
    KShoe(
        name: 'Nike Kids Sunray Protect Sandals',
        price: 14500,
        image: 'assets/images/kidshoe13.png'),
    KShoe(
        name: 'Nike Kids Star Blue Runner',
        price: 11000,
        image: 'assets/images/kidshoe14.png'),
  ];
  TextEditingController _searchController = TextEditingController();
  List<KShoe> _filteredShoes = [];

  @override
  void initState() {
    super.initState();
    _filteredShoes
        .addAll(shoes); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Kids Shoes",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
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
        ],
      ),
    );
  }

  void _filterShoes(String query) {
    _filteredShoes.clear();
    _filteredShoes.addAll(shoes.where(
      (shoe) => shoe.name.toLowerCase().contains(query.toLowerCase()),
    ));
    setState(() {});
  }

  void _showShoeDetails(BuildContext context, KShoe shoe) {
    int knumberOfShoes = 1; 
    String ksize = '23'; 

    List<String> availableSizes = [
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31',
      '32',
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
                  Text('Price: PKR ${shoe.price.toString()}',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    value: ksize,
                    onChanged: (String? newSize) {
                      setState(() {
                        ksize = newSize!;
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
                  Text('Number of Shoes: $knumberOfShoes',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      knumberOfShoes = knumberOfShoes + 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Icon(Icons.add, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (knumberOfShoes > 1) {
                      setState(() {
                        knumberOfShoes = knumberOfShoes - 1;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Icon(Icons.remove, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _addToCart(shoe, knumberOfShoes, ksize);
                    Navigator.pop(context);
                     ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Added to the cart'),
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
                    _buyNow(shoe, knumberOfShoes, ksize);
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

  Future<void> _addToCart(
      KShoe shoe, int knumberOfShoes, String ksize) async {
    await FirebaseFirestore.instance.collection('Items').add({
      'sname': shoe.name,
      'sprice': shoe.price,
      'simage': shoe.image,
      'squantity': knumberOfShoes,
      'size': ksize,
    });
  }

  void _buyNow(KShoe shoe, int knumberOfShoes, String ksize) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalInfoPage4K(
          shoe: shoe,
          ksize: ksize,
          KnumberOfShoes: knumberOfShoes,
        ),
      ),
    );
    print('Buying $knumberOfShoes ${shoe.name}(s) now!');
  }
}

class KShoe {
  final String name;
  final int price;
  final String image;

  KShoe({required this.name, required this.price, required this.image});
}
