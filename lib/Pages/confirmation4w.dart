import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/ordersplash.dart';
import 'package:swagkicks/Pages/women.dart';

class WConfirmation extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final WShoe shoe;
  final int wnumberOfShoes;
  final String wsize;
  WConfirmation(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.shoe,
      required this.wnumberOfShoes,
      required this.wsize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Confirmation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset(
                  'assets/images/swagkicks2.jpg',
                  height: 150,
                ),
              ),
              SizedBox(height: 35.0),
              Text(
                'Name: $name',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 25.0),
              Text(
                'Email: $email',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 25.0),
              Text(
                'Phone: $phone',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 25.0),
              Text(
                'Address: $address',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 25.0),
              Text(
                'Shoe Name: ${shoe.name}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 25.0),
              Text(
                'Delivery Charges (Flat): 200',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Size: ${wsize}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Quantity: ${wnumberOfShoes}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Total Amount: \PKR ${(shoe.price * wnumberOfShoes + 200).toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 25.0),
              Image.asset(
                '${shoe.image}',
                height: 100,
              ),
              SizedBox(height: 24.0),
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
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text('Confirm'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  "Return to Check Out",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
