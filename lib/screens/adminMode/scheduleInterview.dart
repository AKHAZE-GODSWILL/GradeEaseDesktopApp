import 'package:flutter/gestures.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/login.dart';

class ScheduleInterview extends StatefulWidget {
 const ScheduleInterview({Key? key}): super(key: key);

 @override
 State<ScheduleInterview> createState() => _ScheduleInterviewState();
}

class _ScheduleInterviewState extends State<ScheduleInterview>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   actions: [
      //     IconButton(
      //       padding: EdgeInsets.symmetric(horizontal: 20),
      //       onPressed: (){
      //       Navigator.pop(context);
      //     }, 
      //     icon: Icon(Icons.arrow_back, color: Colors.black,)
      //     )
      //   ],
      // ),

      body: Container(color: Colors.green,)
    );
  }


}

