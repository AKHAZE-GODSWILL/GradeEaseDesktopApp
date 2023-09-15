import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/signUp.dart';
import 'package:grade_ease_app/screens/userMode/enterExamID.dart';

class OnboardScreen extends StatefulWidget {
 const OnboardScreen({Key? key}): super(key: key);

 @override
 State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen>{

  String selectedTier ="";


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
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children:[

          Positioned(
            right: 0,
            child: Container(
              // color: Colors.green,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*0.55,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/gradeEaseOnboard.png"),
                 fit: BoxFit.fill),
                
              ),
            ),
          ),
          Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      
              Padding(
                padding: const EdgeInsets.only(left:100),
                child: Container(
                  height: 220,
                  width: 500,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Take Exams quickly",
                        style: TextStyle(
                          fontSize: 50,
                          color: constants.appMainColor
                        ),
                      ),
                      Text("Get ready to embark on a seamless journey of knowledge and assessment. Our user-friendly interface and powerful features will make your learning experience both enjoyable and efficient.",
                        style: TextStyle(
                          fontSize: 18,
                          color: constants.appMainColor
                        ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                          onTap: (){
                            /////////////////// Push to the next page after user has selected a tier
                            
                            // if(selectedTier.isEmpty){
                            //   mywidgets.displayToast(msg: "Please select a tier");
                            // }
                            // else{
                            //   ///// Navigation.push
                            
                            // }

                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EnterExamIDScreen())
                              );                                
                            //will save this parameter to state management later
                          },
                          child: Container(
                            width: 200,
                            height: 36,
                            color: constants.appMainColor,
                            child: Center(
                              child: Text(
                                "Start Exam",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14),),
                            ),
                          ),
                        ),
              
                        SizedBox(width: 20,),
              
                        InkWell(
                          onTap: (){
                            ///////////////// Push to the next page after user has selected a tier
                            
                            ///// Navigation.push
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SignUpScreen())
                              );
                          },
                          child: Container(
                            width: 200,
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: constants.appMainColor
                              )
                            ),
                            child: Center(
                              child: Text(
                                "Admin Mode",
                                style: TextStyle(
                                  color: constants.appMainColor,
                                  fontSize: 14),),
                            ),
                          ),
                        ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
        
          ),
        ),
        ] 
      )
    );
  }


}

