import 'package:flutter/gestures.dart';
import 'package:grade_ease_app/main.dart';
import 'package:flutter/material.dart';
import 'package:grade_ease_app/screens/adminMode/authenticatin/login.dart';

class DashBoard extends StatefulWidget {
 const DashBoard({Key? key}): super(key: key);

 @override
 State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  void initState() {

    // Loads all the data needed by the home page
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: Row(
        children: [
      

          Expanded(
            child: Container(
              color: constants.secondaryAppColor.withOpacity(0.2),
              child: Column(
                children: [
                  Container(
                    height: 350,
                    // color: Colors.red,
                    child: Stack(
                      children: [
                        Container(
                        
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: constants.appMainColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: constants.secondaryAppColor
                                      ),
                                      child: Icon(Icons.stay_primary_landscape_sharp, color: Colors.white,),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Total Number of Exams",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("10",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                
                              },
                              child: Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: constants.secondaryAppColor
                                      ),
                                      child: Icon(Icons.stay_primary_landscape_sharp, color: Colors.white,),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Total Number of Exams",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("10",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                
                              },
                              child: Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: constants.secondaryAppColor
                                      ),
                                      child: Icon(Icons.stay_primary_landscape_sharp, color: Colors.white,),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Total Number of Exams",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("10",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                
                              },
                              child: Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: constants.secondaryAppColor
                                      ),
                                      child: Icon(Icons.stay_primary_landscape_sharp, color: Colors.white,),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Total Number of Exams",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("10",
                                      style: TextStyle(color: constants.secondaryAppColor),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                    
                    
                      ),


                  
                      Container(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                          onTap: () {

                                            // Navigator.push(context, 
                                            // MaterialPageRoute(builder: (context)=> EditCvPage(updateHomescreen: refreshHomePage)));
                                          },
                                          child: Center(
                                            child: Container(
                                              height: 40,
                                              width:200,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                color: constants.secondaryAppColor
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "See More Details",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                  ),
                                                  SizedBox(width: 10,), 
                                                  Icon(Icons.arrow_forward, color: Colors.white)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30,)
                          ],
                        ),
                      )
                      ],
                    ),
                  ),

                  Container(
                    
                    height: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      children: [
                        Container(

                        )
                      ],
                    ),


                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }


}


// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   void _openDrawer() {
//     _scaffoldKey.currentState!.openDrawer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('Drawer Example'),
//         // Add an IconButton to open the drawer
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: _openDrawer,
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Drawer Header'),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               title: Text('Item 1'),
//               onTap: () {
//                 // Add your action when an item is tapped
//               },
//             ),
//             ListTile(
//               title: Text('Item 2'),
//               onTap: () {
//                 // Add your action when an item is tapped
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Main Content'),
//       ),
//     );
//   }
// }
