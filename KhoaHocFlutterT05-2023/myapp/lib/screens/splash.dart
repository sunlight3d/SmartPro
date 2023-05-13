
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  late String? title;//nullable
  SplashScreen({Key? key, this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/background.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border, size: 150, color: Colors.yellow,),
                    SizedBox(height: 50,),
                    Text(title ?? "", style: TextStyle(fontSize: 50, color: Colors.red)),
                    Text(
                      'Chao ban',
                      style: TextStyle(fontSize: 50, color: Colors.white),)
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}