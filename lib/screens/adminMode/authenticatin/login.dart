import 'package:flutter/gestures.dart';
import 'package:grade_ease_app/apiRequests.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/signUp.dart';
import 'package:grade_ease_app/screens/adminMode/homePage.dart';

class LoginScreen extends StatefulWidget {
 const LoginScreen({Key? key}): super(key: key);

 @override
 State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  bool isLoading = false;
  final _textEditingController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordObscured = false;

  @override
  void initState() {
    isPasswordObscured = true;
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("LOGIN",
                        style: TextStyle(
                          fontSize: 50,
                          color: constants.appMainColor
                        ),
                      ),
                      

                      SizedBox(height: 30,),

                      Container(
                        width: 400,
                        child: Column(
                          children: [
                            InkWell(
                          onTap: (){
                            ///////////////// Push to the next page after user has selected a tier
                            
                            ///// Navigation.push
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => SignUpScreen()),
                                (route) => false,
                              );
                          },
                          child: Container(
                            // width: 200,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: constants.appMainColor
                              )
                            ),
                            child: Center(
                              child: Text(
                                "login with Google",
                                style: TextStyle(
                                  color: constants.appMainColor,
                                  fontSize: 14),),
                            ),
                          ),
                        ),

                      SizedBox(height: 30,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Divider(thickness: 2,), 
                          Text(
                                "OR",
                                style: TextStyle(
                                  color: constants.appMainColor,
                                  fontSize: 14),),
                          Divider(thickness: 2,)
                        ],
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
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black
                          )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("Keep me logged in",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ), 
                    ],
                  ),
                ),
                Text("Forgot Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline
                        ),
                        
                )
              ],
            )
          ),

          
                          ],
                        ),
                      ),

                      SizedBox(height: 50,),
          

                      InkWell(
                      onTap: (){
                            if( passwordController.text.isEmpty 
                            || _textEditingController.text.isEmpty ){
                                print("Fill all inputs");
                                myWidgets.showToast(message: "Fill in All inputs");

                            }
                            else{

                                setState(() {
                                  isLoading  = true;
                                });
                              
                                loginMentor(
                              email: _textEditingController.text.trim(), 
                              password: passwordController.text.trim()).then((snapshot) {

                              print(snapshot);

                              setState(() {
                                  isLoading= false;
                                });

                              if(snapshot["msg"] == "Login successful"){
                                Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => HomePage()),
                                (route) => false,
                              );
                              }

                            });
                              
                            }


                            
              
                            //will save this parameter to state management later
                          },
                      child: Container(
                        width: 400,
                        height: 36,
                        color: constants.appMainColor,
                        child: Center(
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log In",
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
              
                        SizedBox(width: 50,)
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

