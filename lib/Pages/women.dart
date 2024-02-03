import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/personalinfo4women.dart';

class Women extends StatefulWidget {
  @override
  State<Women> createState() => _WomenState();
}

class _WomenState extends State<Women> {
  final List<WShoe> shoes = [
    WShoe(
        name: 'Nike Air Max 270',
        price: 12000,
        image: 'assets/images/womenshoe2.png'),
    WShoe(
        name: 'Nike React Element 55',
        price: 23000,
        image: 'assets/images/womenshoe3.png'),
    WShoe(
        name: 'Casual Shoes',
        price: 2500,
        image: 'assets/images/womenshoe.webp'),
    WShoe(
        name: 'Nike Air Force 1 Sage Low',
        price: 13500,
        image: 'assets/images/womenshoe4.png'),
    WShoe(
        name: 'Formal WShoe',
        price: 2000,
        image: 'assets/images/womenshoe1.webp'),
    WShoe(
        name: 'Nike Free RN 5.0',
        price: 25000,
        image: 'assets/images/womenshoe5.png'),
    WShoe(
        name: 'Nike Zoom Pegasus Turbo 2',
        price: 11000,
        image: 'assets/images/womenshoe6.png'),
    WShoe(
        name: 'Nike Joyride Run Flykni',
        price: 8000,
        image: 'assets/images/womenshoe7.png'),
    WShoe(
        name: 'Nike Epic React Flyknit',
        price: 9500,
        image: 'assets/images/womenshoe8.png'),
    WShoe(
        name: 'Nike Air Max 97',
        price: 31500,
        image: 'assets/images/womenshoe9.png'),
    WShoe(
        name: 'Nike Blazer Mid Rebe',
        price: 40000,
        image: 'assets/images/womenshoe10.png'),
    WShoe(
        name: 'Nike Air Max 90',
        price: 31500,
        image: 'assets/images/womenshoe11.png'),
    WShoe(
        name: 'Nike Renew Run',
        price: 26000,
        image: 'assets/images/womenshoe12.png'),
    WShoe(
        name: 'Nike Air Zoom Vomero 14',
        price: 17500,
        image: 'assets/images/womenshoe13.png'),
  ];
  TextEditingController _searchController = TextEditingController();
  List<WShoe> _filteredShoes = [];

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
          "Women Shoes",
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

  void _showShoeDetails(BuildContext context, WShoe shoe) {
    int wnumberOfShoes = 1;
    String wsize = '35'; 

    List<String> availableSizes = [
      '35',
      '36',
      '37',
      '38',
      '39',
      '40',
      '41',
      '42',
      '43',
      '44',
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
                    value: wsize,
                    onChanged: (String? newSize) {
                      setState(() {
                        wsize = newSize!;
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
                  Text('Number of Shoes: $wnumberOfShoes',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wnumberOfShoes = wnumberOfShoes + 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Icon(Icons.add, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (wnumberOfShoes > 1) {
                      setState(() {
                        wnumberOfShoes = wnumberOfShoes - 1;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Icon(Icons.remove, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _addToCart(shoe, wnumberOfShoes, wsize);
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
                    _buyNow(shoe, wnumberOfShoes, wsize);
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
      WShoe shoe, int wnumberOfShoes, String wsize) async {
    await FirebaseFirestore.instance.collection('Items').add({
      'sname': shoe.name,
      'sprice': shoe.price,
      'simage': shoe.image,
      'squantity': wnumberOfShoes,
      'size': wsize,
    });
  }

  void _buyNow(WShoe shoe, int wnumberOfShoes, String wsize) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalInfoPage4W(
          shoe: shoe,
          wsize: wsize,
          wnumberOfShoes: wnumberOfShoes,
        ),
      ),
    );
    print('Buying $wnumberOfShoes ${shoe.name}(s) now!');
  }
}

class WShoe {
  final String name;
  final int price;
  final String image;

  WShoe({required this.name, required this.price, required this.image});
}
