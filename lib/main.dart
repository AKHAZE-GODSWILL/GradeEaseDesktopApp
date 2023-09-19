
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grade_ease_app/myWidgets.dart';
import 'package:grade_ease_app/screens/onBoardscreen.dart';
import 'package:grade_ease_app/constants.dart';

final getX = GetStorage();
Constants constants = Constants();
 MyWidget myWidgets = MyWidget();

Future <void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  MyApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Dara',
      

      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),

//getX.read(constants.GETX_IS_LOGGED_IN) == "true" ? BottomNavBar() : MyOnboarding()
      home: OnboardScreen()
    );
  }
}

