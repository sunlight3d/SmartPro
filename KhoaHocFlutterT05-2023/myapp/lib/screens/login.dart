import 'package:flutter/material.dart';
import 'package:myapp/utilities/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              // Image.asset(
              //   'assets/images/background.jpeg',
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: double.infinity,
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          child: Text('LOGIN',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4CAF50)
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          //padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                        ),
                        onTap: () {
                          print('Loginnnnnn');
                        },
                      )
                    ],
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        contentPadding: EdgeInsets.all(8.0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        contentPadding: EdgeInsets.all(8.0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Forgot your password ?',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          width: 200,
                          child: Text(
                            'PRESS ME',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        SizedBox(width: 10,)
                      ],
                    ),
                    onTap: () async {
                      print('ksks');
                      showRatingDialog(context, (rating) async {
                        var prefs = await SharedPreferences.getInstance();
                        final currentVersion = '1.2.11'; // Thay thế bằng phiên bản hiện tại của ứng dụng
                        final previousVersion = prefs.getString('app_version') ?? '';
                        if (previousVersion.isEmpty || previousVersion != currentVersion) {
                          // Lưu trữ phiên bản hiện tại
                          prefs.setString('app_version', currentVersion);
                          // Hiển thị đánh giá ứng dụng
                          showRatingDialog(context, (rating) async {
                            print('rating = ${rating}');
                            const url = "https://play.google.com/store/apps/details?id=com.google.android.apps.tasks";
                            if (!await launchUrl(
                              Uri.parse(url),
                              mode: LaunchMode.externalApplication,
                            )) {
                              throw Exception('Could not launch $url');
                            }
                          });
                        }
                      });
                    },
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
