
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/userMode/examPage.dart';

class EnterExamIDScreen extends StatefulWidget {
 const EnterExamIDScreen({Key? key}): super(key: key);

 @override
 State<EnterExamIDScreen> createState() => _EnterExamIDScreenState();
}

class _EnterExamIDScreenState extends State<EnterExamIDScreen>{

  final _textEditingController = TextEditingController();

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
        backgroundColor: Colors.white,actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back, color: Colors.black,)
          )
        ],
      ),
      body: Stack(
        children:[

          Positioned(
            top:50,
            right: 70,
            child: Container(
              // color: Colors.green,
              height: MediaQuery.of(context).size.height*0.75,
              width: MediaQuery.of(context).size.width*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/loginIllust.png"),
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
                  height: 600,
                  width: 600,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter Exam ID",
                        style: TextStyle(
                          fontSize: 50,
                          color: constants.appMainColor
                        ),
                      ),
                      

                      SizedBox(height: 30,),

                      Container(
                        width: 400,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: constants.appMainColor
                          )
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 350,
                              child: TextFormField(
                                onChanged: (value){
                                  setState(() {
                                    
                                  });
                                },
                                keyboardType: TextInputType.text,
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when enabled
                              ),
                                  hintText: "user@email.com",
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ExamPage(questionId: "uiuiui")));
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: constants.appMainColor,
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Center(child: Icon(Icons.arrow_forward, color: Colors.white,)),
                              ),
                            )
                          ],
                        ),
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

