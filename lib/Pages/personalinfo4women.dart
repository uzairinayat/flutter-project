import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/confirmation4w.dart';
import 'package:swagkicks/Pages/women.dart';

class PersonalInfoPage4W extends StatefulWidget {
  final WShoe shoe;
  final int wnumberOfShoes;
  final String wsize;
  PersonalInfoPage4W(
      {required this.shoe, required this.wnumberOfShoes, required this.wsize});

  @override
  _PersonalInfoPage4WState createState() => _PersonalInfoPage4WState();
}

class _PersonalInfoPage4WState extends State<PersonalInfoPage4W> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/swagkicks2.jpg',
                  height: 150,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Shoes Name: ${widget.shoe.name}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Quantity: ${widget.wnumberOfShoes}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Size: ${widget.wsize}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Total Price: \PKR ${(widget.shoe.price * widget.wnumberOfShoes).toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text == '' ||
                          _emailController.text == '' ||
                          _phoneController.text == '' ||
                          _addressController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please Enter your Information detail'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        _savePersonalInfo(
                            context,
                            WShoe(
                                name: widget.shoe.name,
                                price: widget.shoe.price,
                                image: widget.shoe.image),
                            widget.wnumberOfShoes,
                            widget.wsize);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Proceed to Check Out'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _savePersonalInfo(
      BuildContext context, WShoe shoe, int wnumberOfShoes, String wsize) {
    String name = _nameController.text.toString();
    String email = _emailController.text.toString();
    String phone = _phoneController.text.toString();
    String address = _addressController.text.toString();
    print('Name: $name\nEmail: $email\nPhone: $phone\nAddress: $address');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WConfirmation(
          name: name,
          email: email,
          phone: phone,
          address: address,
          shoe: shoe,
          wnumberOfShoes: wnumberOfShoes,
          wsize: wsize,
        ),
      ),
    );
  }
}
