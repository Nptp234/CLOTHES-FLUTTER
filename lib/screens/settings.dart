import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsState();
}



class _SettingsState extends State<SettingsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _headerSettingsApp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            GestureDetector(
              onTap: () {              
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 155 ,),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            _buildHorizontalLine(),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Privacy and Security",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 90 ,),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            _buildHorizontalLine(),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.headphones,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Help & Support",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 138 ,),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            _buildHorizontalLine(),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.help,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 220 ,),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            _buildHorizontalLine(),
          ],
        ),
      ),
    );

    
  }

Widget _buildHorizontalLine() {
    return Container(
      width: 350,
      height: 0.5,
      color: Colors.grey,
    );
  }
  PreferredSize _headerSettingsApp(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xFF0060FF),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                  
                children: [
                  IconButton(
                        onPressed: (){ 
                          
                        }, 
                        icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white,)
                      ),
                    const SizedBox(
                      width: 270,
                      child: Text('Settings App', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                    ),
                  
                ],
              ),
              
            ],
          ),
        )
      ),
    );
  }
}