import 'package:flutter/gestures.dart';
import 'package:grade_ease_app/apiRequests.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/login.dart';
import 'package:grade_ease_app/screens/adminMode/dashBoard.dart';
import 'package:grade_ease_app/screens/adminMode/homePage.dart';

class SignUpScreen extends StatefulWidget {
 const SignUpScreen({Key? key}): super(key: key);

 @override
 State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{

  final nameEditingController = TextEditingController();
  final _textEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;

  @override
  void initState() {
    isPasswordObscured = true;
    isConfirmPasswordObscured = true;
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
        actions: [
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
                image: DecorationImage(image: AssetImage("assets/signUpIllust.png"),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("WELCOME!",
                        style: TextStyle(
                          fontSize: 50,
                          color: constants.appMainColor
                        ),
                      ),

                      Text("Get started creating easy and accesible quiz, manage your students accounts and automatically select qualified students based on merit from tesst scores",
                        style: TextStyle(
                          fontSize: 18,
                          color: constants.appMainColor
                        ),),
                      

                      SizedBox(height: 30,),

                      Container(
                        width: 400,
                        child: Column(
                          children: [
                            Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name",
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
                                controller: nameEditingController,
                                decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none, // Remove the border when enabled
                              ),
                                  hintText: "name",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",
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
                                keyboardType: TextInputType.emailAddress,
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
                          ],
                        ),
                      ),

          SizedBox(height: 20,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Password", style: TextStyle(
                  fontSize: 14, 
                  color: constants.appMainColor),),
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
                    obscureText: isPasswordObscured,
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove the border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove the border when enabled
                  ),
                      hintText: "Enter Password",
                      suffixIcon: IconButton(
                        padding: EdgeInsetsDirectional.only(end:12),
                        icon: isPasswordObscured? Icon(Icons.visibility_off, color: constants.appMainColor,)
                        :Icon(Icons.visibility, color: constants.appMainColor,),
                        onPressed: (){
                          setState(() {
                            isPasswordObscured = !isPasswordObscured;
                          });
                        }
                      ),
                    ),
                    validator: (value) {
                      // if(value == null || value.isEmpty){
                      //   passwordFocusNode.requestFocus();
                      //   return "Please enter some text";
                      // }
                      // if(value.length <6){
                      //   passwordFocusNode.requestFocus();
                      //   return "Password must be atleast 6 characters";
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confrim Password", style: TextStyle(
                  fontSize: 14, 
                  color: constants.appMainColor),),
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
                    obscureText: isConfirmPasswordObscured,
                    keyboardType: TextInputType.text,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove the border when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove the border when enabled
                  ),
                      hintText: "Enter Password",
                      suffixIcon: IconButton(
                        padding: EdgeInsetsDirectional.only(end:12),
                        icon: isConfirmPasswordObscured? Icon(Icons.visibility_off, color: constants.appMainColor,)
                        :Icon(Icons.visibility, color: constants.appMainColor,),
                        onPressed: (){
                          setState(() {
                            isConfirmPasswordObscured = !isConfirmPasswordObscured;
                          });
                        }
                      ),
                    ),
                    validator: (value) {
                      // if(value == null || value.isEmpty){
                      //   passwordFocusNode.requestFocus();
                      //   return "Please enter some text";
                      // }
                      // if(value.length <6){
                      //   passwordFocusNode.requestFocus();
                      //   return "Password must be atleast 6 characters";
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),

          
                          ],
                        ),
                      ),

                      SizedBox(height: 50,),
          

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                          onTap: isLoading? (){}: (){
                            if(nameEditingController.text.isEmpty 
                            || passwordController.text.isEmpty 
                            || confirmPasswordController.text.isEmpty
                            || _textEditingController.text.isEmpty ){
                                print("Fill all inputs");
                                myWidgets.showToast(message: "Fill all inputs");

                            }
                            else{
                              if(passwordController.text.trim() != confirmPasswordController.text.trim()){
                                // myWidget
                                print("Incorrect Password");
                                myWidgets.showToast(message: "Incorrect Password");
                              }
                              else{
                                setState(() {
                                  isLoading= true;
                                });

                                print("Before the signup mentpr");

                                signUpMentor(
                              fullname: nameEditingController.text.trim(),
                              email: _textEditingController.text.trim(), 
                              password: passwordController.text.trim()).then((snapshot) {

                                print(snapshot);

                                setState(() {
                                  isLoading= true;
                                });
                              
                              getX.write(constants.GETX_TOKEN, snapshot["token"]);
                              getX.write(constants.GETX_FULLNAME, snapshot["user"]["name"]);
                              // getX.write(constants.GETX_IS_LOGGED_IN, "true");
                              getX.write(constants.GETX_USER_ID, snapshot["user"]["_id"]);

                              setState(() {
                                  isLoading= false;
                                });

                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => HomePage()),
                                (route) => false,
                              );

                            });
                              }
                            }


                            
              
                            //will save this parameter to state management later
                          },
                          child: Container(
                            width: 250,
                            height: 36,
                            color: constants.appMainColor,
                            child: Center(
                              child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Submit",
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
              
                        SizedBox(width: 50,),
              
                        Container(
                          width: 250,
                          height: 36,
                          child: Center(
                            child: RichText(
                        text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: constants.appMainColor
                            )
                            
                          ),
                          
                          TextSpan(
                            text: 'Login here',
                            style: TextStyle(
                              color: constants.appMainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                 ///// Navigation.push
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                    (route) => false,
                                  );
                              }
                          )
                        ],
                        ),
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

