import 'package:flutter/gestures.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/login.dart';

class SignUpScreen extends StatefulWidget {
 const SignUpScreen({Key? key}): super(key: key);

 @override
 State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>{

  final _textEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                                "Sign Up with Google",
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
                          onTap: (){
                            /////////////////// Push to the next page after user has selected a tier
                            
                            // if(selectedTier.isEmpty){
                            //   mywidgets.displayToast(msg: "Please select a tier");
                            // }
                            // else{
                            //   ///// Navigation.push
                            //   Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(builder: (context) => Registration()),
                            //     (route) => false,
                            //   );
                            // }
              
                            //will save this parameter to state management later
                          },
                          child: Container(
                            width: 250,
                            height: 36,
                            color: constants.appMainColor,
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14),),
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

