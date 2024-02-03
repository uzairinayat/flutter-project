import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/confirmation4k.dart';
import 'package:swagkicks/Pages/kids.dart';

class PersonalInfoPage4K extends StatefulWidget {
  final KShoe shoe;
  final int KnumberOfShoes;
  final String ksize;
  PersonalInfoPage4K(
      {required this.shoe, required this.KnumberOfShoes, required this.ksize});

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage4K> {
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
                  'Quantity: ${widget.KnumberOfShoes}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Size: ${widget.ksize}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Total Price: \PKR ${(widget.shoe.price * widget.KnumberOfShoes).toStringAsFixed(2)}',
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
                            KShoe(
                                name: widget.shoe.name,
                                price: widget.shoe.price,
                                image: widget.shoe.image),
                            widget.KnumberOfShoes,
                            widget.ksize);
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
      BuildContext context, KShoe shoe, int KnumberOfShoes, String ksize) {
    String name = _nameController.text.toString();
    String email = _emailController.text.toString();
    String phone = _phoneController.text.toString();
    String address = _addressController.text.toString();
    print('Name: $name\nEmail: $email\nPhone: $phone\nAddress: $address');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KConfirmation(
          name: name,
          email: email,
          phone: phone,
          address: address,
          shoe: shoe,
          KnumberOfShoes: KnumberOfShoes,
          ksize: ksize,
        ),
      ),
    );
  }
}
