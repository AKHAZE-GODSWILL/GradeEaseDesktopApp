import 'package:flutter/gestures.dart';
import 'package:grade_ease_app/apiRequests.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/addQuestion.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/login.dart';

class CreateExam extends StatefulWidget {
 const CreateExam({Key? key}): super(key: key);

 @override
 State<CreateExam> createState() => _CreateExamState();
}

class _CreateExamState extends State<CreateExam>{
  
  bool isLoading = false;
  final _newExamController = TextEditingController();
  final durationController = TextEditingController();
  final cutOffController = TextEditingController();

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
      body: Container(
              
            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
            child: Column(
              children: [

                Container(
                  child: Text("Add New Exam",
                    style:TextStyle(
                    decoration: TextDecoration.none,
                    color: constants.appMainColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 20
                                    ),),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height* 0.05
                ),

                

                Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Exam Name",
                             style: TextStyle(fontSize: 14,
                              color: constants.appMainColor
                             ),),
                            SizedBox(height: 5,),
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                  color: constants.appMainColor.withOpacity(0.2)
                                )
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  setState(() {
                                    
                                  });
                                },
                                keyboardType: TextInputType.text,
                                controller: _newExamController,
                                decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when enabled
                              ),
                                  // hintText: "user@email.com",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                SizedBox(
                  height: MediaQuery.of(context).size.height* 0.02
                ),

                Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Exam Duration",
                             style: TextStyle(fontSize: 14,
                              color: constants.appMainColor
                             ),),
                            SizedBox(height: 5,),
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                  color: constants.appMainColor.withOpacity(0.2)
                                )
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  setState(() {
                                    
                                  });
                                },
                                keyboardType: TextInputType.number,
                                controller: durationController,
                                decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when enabled
                              ),
                                  // hintText: "user@email.com",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                  height: MediaQuery.of(context).size.height* 0.02
                ),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Exam Pass Mark",
                             style: TextStyle(fontSize: 14,
                              color: constants.appMainColor
                             ),),
                            SizedBox(height: 5,),
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                  color: constants.appMainColor.withOpacity(0.2)
                                )
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  setState(() {
                                    
                                  });
                                },
                                keyboardType: TextInputType.number,
                                controller: cutOffController,
                                decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when enabled
                              ),
                                  // hintText: "user@email.com",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                  height: MediaQuery.of(context).size.height* 0.02
                ),
                
                GestureDetector(
                  onTap: isLoading? (){}: (){

                            if( _newExamController.text.isEmpty 
                            || durationController.text.isEmpty
                            || cutOffController.text.isEmpty ){
                                print("Fill all inputs");
                                myWidgets.showToast(message: "Fill in All inputs");

                            }
                            else{

                                setState(() {
                                  isLoading  = true;
                                });
                              
                                createExam(
                                  title: _newExamController.text.trim(), 
                                  duration: durationController.text.trim(), 
                                  cutOff: cutOffController.text.trim()).then((snapshot) {

                              print(snapshot);

                              setState(() {
                                  isLoading= false;
                                });

                              if(snapshot["msg"] == "Exam created"){


                                Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => AddQuestion()),
                                (route) => false,
                              );

                              }

                            });
                              
                            }
                                  
                                },
                  child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constants.appMainColor
                                ),
                                child: Center(
                                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ok",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(width: 10,),
                       isLoading? SizedBox(
                        height: 20,
                        width: 20 ,
                        child: CircularProgressIndicator(color: Colors.white)): Icon(Icons.arrow_forward, color: Colors.white,)
                      ],
                    ),
                                ),
                              ),
                ),

                
              ],
            ),
            )
    );
  }


}

