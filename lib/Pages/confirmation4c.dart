import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swagkicks/Pages/ordersplash.dart';

class ConfirmationCart extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;

  ConfirmationCart({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  _ConfirmationCartState createState() => _ConfirmationCartState();
}

class _ConfirmationCartState extends State<ConfirmationCart> {
  late Future<List<ConfirmItem>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = _fetchDataFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Confirmation Page'),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/swagkicks2.jpg',
                    height: 150,
                  ),
                ),
                SizedBox(height: 45.0),
                Text(
                  'Name: ${widget.name}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Email: ${widget.email}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Phone: ${widget.phone}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Address: ${widget.address}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 25.0),
                Text(
                  'Delivery Charges (Flat): 200',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 25.0),
                FutureBuilder<List<ConfirmItem>>(
                  future: _futureItems,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<ConfirmItem> _cartItems = snapshot.data!;
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _cartItems.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image.asset(
                                    _cartItems[index].simage,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    '${_cartItems[index].sname}',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price: PKR ${_cartItems[index].sprice.toString()}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Size: ${_cartItems[index].size}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        'Quantity: ${_cartItems[index].squantity.toString()}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 2,
                            height: 25,
                          ),
                          Text(
                            'Total: \PKR ${_calculateTotal(_cartItems) + 200.toInt()}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Order is Confirmed'),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.blueAccent,
                                ),
                              );
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderCompleteSplash(),
                                  ));
                              _deleteDataFromFirestore();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Text('Confirm'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              "Return to Check Out",
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _deleteDataFromFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('Items')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
      print('Data deleted successfully');
    } catch (e) {
      print('Error deleting data: $e');
    }
  }

  double _calculateTotal(List<ConfirmItem> cartItems) {
    return cartItems.fold(0, (total, item) => total + item.sprice * item.squantity);
  }

  Future<List<ConfirmItem>> _fetchDataFromFirestore() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Items').get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ConfirmItem(
        sname: data['sname'],
        sprice: data['sprice'],
        simage: data['simage'],
        size: data['size'],
        squantity: data['squantity'],
      );
    }).toList();
  }
}

class ConfirmItem {
  final String sname;
  final int sprice;
  final String simage;
  final String size;
  final int squantity;

  ConfirmItem({
    required this.sname,
    required this.sprice,
    required this.simage,
    required this.size,
    required this.squantity,
  });
}
