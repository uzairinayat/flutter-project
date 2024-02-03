import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swagkicks/Pages/personalinfo4c.dart';

class CartTab extends StatefulWidget {
  @override
  _CartTabState createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CartItem>>(
      future: _fetchDataFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        } else if (snapshot.hasError) {
          // If there is an error
          return Text('Error: ${snapshot.error}');
        } else {
          List<CartItem> _cartItems = snapshot.data!;

          return Container(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset(
                            _cartItems[index].simage,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            _cartItems[index].sname,
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price: \PKR ${_cartItems[index].sprice.toString()}',
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
                          trailing: IconButton(
                            icon: Icon(Icons.remove_shopping_cart,
                                color: Colors.black),
                            onPressed: () {
                              _removeItem(_cartItems[index].documentId);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \PKR ${_calculateTotal(_cartItems).toString()}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                InkWell(
                  onTap: () {
                    _handleBuy();
                  },
                  splashColor: Colors.grey,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Check Out',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  Future<List<CartItem>> _fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Items').get();

      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return CartItem(
          documentId: doc.id,
          sname: data['sname'],
          sprice: data['sprice'],
          simage: data['simage'],
          size: data['size'],
          squantity: data['squantity'],
        );
      }).toList();
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  double _calculateTotal(List<CartItem> cartItems) {
    return cartItems.fold(0, (total, item) => total + item.sprice*item.squantity);
  }

  void _handleBuy() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PersonalInfoPage4Cart(),
        ));
    print('Buy button clicked!');
  }

  void _removeItem(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Items')
          .doc(documentId)
          .delete();
      print('Item removed successfully.');
      setState(() {});
    } catch (e) {
      print('Error removing item: $e');
    }
  }
}

class CartItem {
  final String documentId;
  final String sname;
  final int sprice;
  final String simage;
  final String size;
  final int squantity;

  CartItem({
    required this.documentId,
    required this.sname,
    required this.sprice,
    required this.simage,
    required this.size,
    required this.squantity,
  });
}
