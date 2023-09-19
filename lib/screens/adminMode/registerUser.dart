import 'dart:convert';
import 'dart:io';

import 'package:grade_ease_app/apiRequests.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:grade_ease_app/screens/adminMode/addQuestion.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/login.dart';

class RegisterUser extends StatefulWidget {
 const RegisterUser({Key? key}): super(key: key);

 @override
 State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser>{
  String updatedImage = "";
  String imgPath = "";
  String imgExt = "";

  File? readyUploadImage;
  bool hasImg = false;
  bool isLoading = false;
  final _fullnameController = TextEditingController();

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
                  child: Text("Add New Student",
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
                            Container(
                                                        
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    
                                  color: Colors.grey,
                                  shape: BoxShape.circle
                                  ),              
                                     child: updatedImage.isEmpty ? Icon(Icons.person,
                                         size: 100, color:Colors.white)
                                         : ClipOval(
                                           child: Image.file(
                                            File(readyUploadImage!.path),
                                            fit: BoxFit.cover
                                           ),
                                         )
                              ),


                              InkWell(
                                onTap: isLoading? (){}: (){

                                      setState(() {
                                        pickImage(context).then((value) {
                                          setState(() {
                                            updatedImage = readyUploadImage!.path;
                                          });
                                        });  
                                      });

                                                      
                                },
                            child:Row(
                            
                              mainAxisAlignment: MainAxisAlignment.start,
        
                              children: [
        
                                Text(
        
                                  "Upload Image",
        
                                  style: TextStyle(fontSize: 14, color: constants.appMainColor),
        
                                ),
        
                                SizedBox(width: 10,), 
        
                                Icon(Icons.arrow_forward, color: constants.appMainColor)
        
                              ],
        
                            ),
                          ),


                          SizedBox(height: 30,),

                              


                            Text("Student Name",
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
                                controller: _fullnameController,
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

                            if(_fullnameController.text.isNotEmpty){
                              setState(() {
                                isLoading = true;
                              });

                              registerStudent(updatedImage).then((value) {
                                // setState(() {
                                //   isLoading = false;
                                //   _fullnameController.text = "";
                                //   updatedImage = "";
                                // });
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


  Future<void> pickImage(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false, // Set to true if you want to select multiple images
  );

  if (result != null && result.files.isNotEmpty) {
    readyUploadImage = File(result.files.single.path!);

    // Use the selectedImage for further processing.
    print('Selected Image: ${readyUploadImage!.path}');
    // Add your image handling logic here.
  } else {
    // User canceled the file picker dialog or didn't select any files.
  }
}


Future<void> registerStudent(String imgPath) async {
    signUpStudent(fullname: _fullnameController.text.trim()).then((snapshot) async{


        if(imgPath.isNotEmpty){
          var request = http.MultipartRequest(
        'Post',
        Uri.parse(
            "https://gradeeasebackend.onrender.com/students/updateProfilePic"));

            // The field name is the key value that we used when we were writing the end point
            request.fields['student_id'] = snapshot["student"]["_id"];
            request.files.add(await http.MultipartFile.fromPath('image', imgPath));
            request.headers.addAll({"Content-type": "multipart/form-data"});

            http.StreamedResponse response = await request.send();
            var httpResponse = await http.Response.fromStream(response);
            var data = await json.decode(httpResponse.body);
            print(data['img_url']);
            print(response.statusCode);
        }

    });

    
  
  }


}

