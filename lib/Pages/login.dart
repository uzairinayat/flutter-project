import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/profile.dart';
import 'package:swagkicks/Pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swagkicks/utils/messageshow.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login() async {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: _emailController.text.toString(),
            password: _passwordController.text.toString())
        .then((value) {
      Showmessage().toastmess(value.user!.email.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfileTab1()));
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully LogIn'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blueAccent,
        ),
      );
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Showmessage().toastmess(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Login Page',
          style:
              TextStyle(color: Colors.white), 
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black, 
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/swagkicks.png', 
                width: 150.0, 
                height: 150.0, 
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(
                          255, 245, 19, 2)), 
                ),
                child: Text(
                  'Swag Kicks',
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 247, 248),
                    fontSize:
                        32.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, 
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: TextField(
                  controller: _emailController,
                  style:
                      TextStyle(color: Colors.white), 
                  decoration: InputDecoration(
                    labelText: 'Username Or Email',
                    labelStyle: TextStyle(
                        color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                style:
                    TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.white), 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      loading ? "Loading..." : 'Login',
                      style: TextStyle(
                          color:
                              Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                      print('Sign Up button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color:
                              Colors.white), 
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
