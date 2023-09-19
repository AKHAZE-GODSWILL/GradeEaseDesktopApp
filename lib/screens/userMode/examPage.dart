
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grade_ease_app/apiRequests.dart';
import 'package:grade_ease_app/main.dart';
import 'package:grade_ease_app/models/questionsModel.dart';

// this is the first page that runs on the app currently
class ExamPage extends StatefulWidget {
  const ExamPage({Key? key, required this.exam_id}): super(key: key);
  
  final exam_id;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  // Creating a page view controller
  // controllers helps you controls one widget through the actions you take on another widget
  bool isLoading = false;
  Map<String, bool> option3 = {"home":false};

  int? examDuration;
  PageController _pageController = PageController(initialPage: 0);
  List<dynamic> questionData = [
    {
      "id":"hhfhfhfh",
      "courseId":"Er",
      "questionText": "Who is the prime minister of Lagos", 
      "options": [
        {"optionText": "Me", "isCorrect": true}, 
        {"optionText": "You", "isCorrect": false}, 
        {"optionText": "Us", "isCorrect": false}], 
      "timestamp": DateTime.now()
    },
    {
      "id":"ydcvzdgd",
      "courseId":"Er",
      "questionText": "What is your favourite subject", 
      "options": [{"optionText": "Maths", "isCorrect": true}, {"optionText": "English", "isCorrect": false}], 
      "timestamp": DateTime.now()
    },
    // {
    //   "id":"hhfhfhfh",
    //   "courseId":"Er",
    //   "question": "Who is the prime minister of Lagos", 
    //   "options": [{"Me":true}, {"you":false}, {"us": false}], 
    //   "timestamp": DateTime.now()
    // },
  ];
  
  // List<QuestionsModel> question = [QuestionsModel(
  //   id: "HDHDHDH",
  //   courseId: "ER", 
  //   question: "Who is the prime minister of Lagos", 
  //   options: [{"Me":true}, {"you":false}, {"us": false}], 
  //   timestamp: DateTime.now()),
    
  //   QuestionsModel(
  //     id: "ddfdd", 
  //     courseId: "ER", 
  //     question: "What is your best subject", 
  //     options: [{"math":false, "English":false}], 
  //     timestamp: DateTime.now()
  //     )
  //   ];

  // The question variables 
  // bool isPressed = false;
  Color btnColor = Colors.white;
  Color btnTextColot = constants.secondaryAppColor;
  int score = 0;

  int pickedIndex = -1;

  @override
  void initState() {

    print("The init state started");

    // questionData.addAll(questionsBox.values.toList().cast<QuestionsModel>());

      setState(() {
        isLoading = true;
      });

      

      fetchExam(exam_id: widget.exam_id).then((snapshot) {
          setState(() {
            print(snapshot);
            questionData.clear();
            examDuration = snapshot["exam"]["duration"];
            questionData = snapshot["exam"]["questions"];
            isLoading = false;
          });
        });


      

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(18),
      
        // the page builder is a single widget that renders as many pages needed.
        // To the user, it seems that the page is changing. But its still the same page. Only data is changing
        // example of this kind of feature is your status page on whatsapp, or stories page on instagram
      
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: isLoading? Center(child: CircularProgressIndicator()):Column(
              children: [
                
                Container(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: TestTimerWidget(minutes: examDuration!, onTimerEnd: (){
                    Navigator.pop(context);
                  })
                  ),
                Expanded(
                  child: PageView.builder(
                    //The controller is set here
                    controller: _pageController,
                    onPageChanged: (page){
                      setState(() {
                        pickedIndex = -1;
                      });
                    },
                
                    // disables the scrolling of the page so that we scroll only with the buttons
                    physics: NeverScrollableScrollPhysics(),
                    // the item count is the number of items to be dispayed.
                    // We get this dynamically by getting the length of the list of the questions in our questionsList page
                    itemCount: questionData.length,
                      
                    // the item builder renders the widget that is common to all the pages
                    // But only changes the data through the index
                      
                    itemBuilder: (context, index){
                      
                      print(questionData[index]["options"]!);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // The text widget holding the question number
                          Container(
                            width: double.infinity,
                            child: Text("Question ${index + 1}/ ${questionData.length}",
                            style:  TextStyle(
                              color: constants.appMainColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 28
                            ),),
                          ),
                      
                          // the divider widget
                          const Divider(
                            color: Colors.white,
                            height: 8,
                            thickness: 1,
                          ),
                      
                          // gives a spacing in height between two widgets
                          const SizedBox(
                            height: 20,
                          ),
                      
                          // the text that holds the questions
                          Text(questionData[index]["questionText"]!,
                            style:  TextStyle(
                              color: constants.appMainColor,
                              fontSize: 28
                            ),
                          ),
                      
                          // gives a spacing in height between two widgets
                          const SizedBox(
                            height: 35,
                          ),
                      
                      
                          // this next part generates the button widgets according to the number of options provided
                          // you can use a for loop and also use mapping out a widget to set this
                      
                          for(int i =0; i<questionData[index]["options"]!.length; i++  )
                      
                           Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              minHeight: 70
                            ),
                            margin: EdgeInsets.only(bottom: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: constants.secondaryAppColor
                              )
                            ),
                            child: MaterialButton(onPressed: (){
                      
                             setState(() {
                      
                              print(i);
                              pickedIndex = i;
                              //when the button is pressed, it checks if the option is true
                              // if its true, it sets the color to green
                              if(questionData[index]["options"]![i]["isCorrect"]){
                                
                                  btnColor = constants.secondaryAppColor;
                                  btnTextColot = Colors.white;
                                  score += 10; 
                              }
                      
                              // it sets the color to red
                              else{
                                
                                  btnColor = constants.secondaryAppColor;
                                  btnTextColot = Colors.white;
                              }
                
                              print(score);
                             });
                            },
                      
                              padding: EdgeInsets.only(left: 15, right: 15),
                              shape: StadiumBorder(),
                              
                              // the color is stored in a variable so that it can be altered in the future questions[index].options!.entries.toList()[i].value
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: (pickedIndex==i)? constants.secondaryAppColor: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: constants.secondaryAppColor
                                        )
                                      ),
                                      child: Center(
                                        child: Text(
                                          (i==0)? "A":(i==1)? "B": (i==2)? "C":"D",
                                          style: TextStyle(color: (pickedIndex==i)? Colors.white:constants.secondaryAppColor),
                                          ),
                                      ),
                                    ),
                                  ),
                                  Text(questionData[index]["options"]![i]["optionText"],
                                    style:  TextStyle(
                                    color: constants.appMainColor,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          )
                          ,
                
                
                
                
                
                
                      
                          //   Container(
                          //     height: 400,
                          //   // width: MediaQuery.of(context).size.width,
                          //   // constraints: BoxConstraints(
                          //   //   minHeight: 200,
                      
                          //   // ),
                          //   child: ListView.builder(
                          //     // physics: ,
                          //     itemCount: questionData[index]["options"]!.length,
                          //     itemBuilder: (context, i){
                          //       print(questionData[index]["options"]);
                          //       return Container(
                          //   width: double.infinity,
                          //   constraints: BoxConstraints(
                          //     minHeight: 70
                          //   ),
                          //   margin: EdgeInsets.only(bottom: 18),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(40),
                          //     border: Border.all(
                          //       color: constants.secondaryAppColor
                          //     )
                          //   ),
                          //   child: MaterialButton(onPressed: (){
                      
                          //    setState(() {
                      
                          //     print(i);
                          //     pickedIndex = i;
                          //     //when the button is pressed, it checks if the option is true
                          //     // if its true, it sets the color to green
                          //     if(questionData[index]["options"]![i].entries.toList()[0].value){
                                
                          //         btnColor = constants.secondaryAppColor;
                          //         btnTextColot = Colors.white;
                          //         score += 10; 
                          //     }
                      
                          //     // it sets the color to red
                          //     else{
                                
                          //         btnColor = constants.secondaryAppColor;
                          //         btnTextColot = Colors.white;
                          //     }
                
                          //     print(score);
                          //    });
                          //   },
                      
                          //     padding: EdgeInsets.only(left: 15, right: 15),
                          //     shape: StadiumBorder(),
                              
                          //     // the color is stored in a variable so that it can be altered in the future questions[index].options!.entries.toList()[i].value
                          //     color: Colors.white,
                          //     child: Row(
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.symmetric(horizontal:10),
                          //           child: Container(
                          //             height: 30,
                          //             width: 30,
                          //             decoration: BoxDecoration(
                          //               color: (pickedIndex==i)? constants.secondaryAppColor: Colors.white,
                          //               borderRadius: BorderRadius.circular(4),
                          //               border: Border.all(
                          //                 color: constants.secondaryAppColor
                          //               )
                          //             ),
                          //             child: Center(
                          //               child: Text(
                          //                 (i==0)? "A":(i==1)? "B": (i==2)? "C":"D",
                          //                 style: TextStyle(color: (pickedIndex==i)? Colors.white:constants.secondaryAppColor),
                          //                 ),
                          //             ),
                          //           ),
                          //         ),
                          //         Text(questionData[index]["options"]![i].keys.toList()[0],
                          //           style:  TextStyle(
                          //           color: constants.appMainColor,
                          //           )
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                          //   }),
                          // ),
                      
                          
                          
                          // gives a spacing in height between two widgets
                          const SizedBox(
                            height: 50,
                          ),
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 0? SizedBox(): OutlinedButton(
                                onPressed: (){
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear
                                  );
                                },
                                child: Text(
                                  "Previus Question",
                                style:  TextStyle(
                                  color: constants.secondaryAppColor
                                ),
                                ),
                                style: ButtonStyle(),
                              ),
                
                
                              OutlinedButton(
                                onPressed: index + 1 == questionData.length? (){
                                  
                                  
                                  // Navigator.push(context,
                                  //  MaterialPageRoute(
                                  //   builder: (context)=> ResultScreen(score: score)));
                
                                }:(){
                
                                  
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear
                                  );
                                },
                                child: Text(
                                  index + 1 == questionData.length? "Submit"
                                  :"Next Question",
                                style: TextStyle(
                                  color: constants.secondaryAppColor
                                ),
                                ),
                                style: ButtonStyle(),
                              ),
                            ],
                          ),
                            
                      
                      
                        ],
                      );
                    }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildTestTimerWidget(BuildContext context, int minutes, Function onTimerEnd) {
    String formattedTime = '';
    startTestTimer(context, minutes, (time) {
      formattedTime = time;
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Test Timer",
          style: TextStyle(fontSize: 24),
        ),
        Text(
          formattedTime,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void startTestTimer(BuildContext context, int minutes, Function(String) onTimeUpdate) {
    int secondsRemaining = minutes * 60;

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        onTimeUpdate(formatTime(secondsRemaining));
        });
      } else {
        setState(() {
          timer.cancel();
        onTimeUpdate("00:00:00");
        print("Time is up!");
        });
      }
    });
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}


class TestTimerWidget extends StatefulWidget {
  final int minutes;
  final Function onTimerEnd;

  TestTimerWidget({required this.minutes, required this.onTimerEnd});

  @override
  _TestTimerWidgetState createState() => _TestTimerWidgetState();
}

class _TestTimerWidgetState extends State<TestTimerWidget> {
  late int secondsRemaining;
  late String formattedTime;

  @override
  void initState() {
    super.initState();
    startTestTimer();
  }

  void startTestTimer() {
    secondsRemaining = widget.minutes * 60;
    formattedTime = formatTime(secondsRemaining);

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
          formattedTime = formatTime(secondsRemaining);
        });
      } else {
        timer.cancel();
        widget.onTimerEnd();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Time",
          style: TextStyle(fontSize: 24),
        ),
        Text(
          formattedTime,
          style: TextStyle(
            color: constants.appMainColor,
            fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}