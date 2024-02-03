import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/men.dart';
import 'package:swagkicks/Pages/ordersplash.dart';

class Confirmation extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final Shoe shoe;
  final int numberOfShoes;
  final String size;
  Confirmation(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.shoe,
      required this.numberOfShoes,
      required this.size});

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
                'Quantity: ${numberOfShoes}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                  height: 15,
                ),
                Text(
                  'Size: ${size}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Total Amount: \PKR ${(shoe.price * numberOfShoes + 200).toStringAsFixed(2)}',
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
