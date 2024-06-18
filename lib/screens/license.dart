import 'package:flutter/material.dart';

class MyLicense extends StatefulWidget {
  MyLicense({super.key});

  @override
  State<MyLicense> createState() => _MyLicenseState();
}

class _MyLicenseState extends State<MyLicense> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _headerLicense(),

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
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 144 ,),
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
                      Icons.policy_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Terms of Use",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 150 ,),
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
                    "Supports",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 187 ,),
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
  PreferredSize _headerLicense(){
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
                      width: 280,
                      child: Text('Account Center', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
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