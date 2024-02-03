import 'package:flutter/material.dart';
import 'package:swagkicks/Pages/kids.dart';
import 'package:swagkicks/Pages/men.dart';
import 'package:swagkicks/Pages/women.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset(
                  'assets/images/swagkicks2.jpg',
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "All the Amazing and 100% original Sneakers",
                style: TextStyle(
                  color: Colors.white,
                ),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 35,
              ),
              Material(
                color: Colors.red,
                elevation: 8,
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black45,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Men()));
                  },
                  child: Row(
                    children: [
                      Ink.image(
                        image: AssetImage('assets/images/men.jpg'),
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Men",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Material(
                color: Colors.red,
                elevation: 8,
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black45,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Women()));
                  },
                  child: Row(
                    children: [
                      Ink.image(
                        image: AssetImage('assets/images/women.jpg'),
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Women",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Material(
                color: Colors.red,
                elevation: 8,
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black45,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kids()));
                  },
                  child: Row(
                    children: [
                      Ink.image(
                        image: AssetImage('assets/images/kids.jpg'),
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Kids",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
