import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/podcasts.dart';
import 'package:myapp/screens/splash.dart';
import 'package:myapp/utilities/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
import 'repositories/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerLazySingleton<UserRepository>(() => UserRepository());
  // Kiểm tra xem ứng dụng đã được nâng cấp hay chưa
  final prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async{

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        //home: SplashScreen(title: "This is splash",)
        //home: LoginScreen()
      home: Podcasts()
    );
  }
}


