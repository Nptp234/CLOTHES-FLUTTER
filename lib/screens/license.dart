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

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            _titleBodyCustom(context, Icons.lock, 'Privacy Policy'),
            _titleBodyCustom(context, Icons.policy, 'Terms of Use'),
            _titleBodyCustom(context, Icons.help, 'Supports'),
            
          ],
        ),
      ),
    );
  }

  Widget _titleBodyCustom(BuildContext context, IconData icon, String title){
    // Widget widget = SettingsScreen();
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
      },

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(bottom: 30),

        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        ),

        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Icon(icon, size: 30, color: Colors.black,)
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 5,
              child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),)
            ),
            Expanded(
              flex: 1,
              child: Icon(Icons.arrow_forward_ios, size: 20,)
            )
          ],
        )
      ),
    );
  }

  PreferredSize _headerLicense(){
    return PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        
        child: Stack(
          children: [
             Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                height: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                  color: Color(0xFF0060FF),
                ),

                child: const Positioned(
                    bottom: 10,
                    left: 30,
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 40,),
                  )
                ),
            )
          ],
        )
      );
  }

}