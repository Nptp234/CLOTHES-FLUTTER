import 'package:clothes_app/objects/user.dart';
import 'package:clothes_app/screens/account.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:flutter/material.dart';

class AccountCenter extends StatefulWidget {
  AccountCenter({super.key});
  
  
  @override
  State<AccountCenter> createState() => _AccountCenterState();
  
}

class _AccountCenterState extends State<AccountCenter> {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UserAcount user = UserAcount();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _headerAccountCenter(),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username",
                style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
            ),
            ),
            Container(
              width: 350,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(60))
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        decoration:  InputDecoration(
                          hintText: user.name,
                          focusColor: Colors.white,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                        ),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Email",
                style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
            ),
            ),
            Container(
                height: 50,
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(60))
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        decoration:  InputDecoration(
                          hintText: user.email,
                          focusColor: Colors.white,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                        ),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    
                    
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Password",
                style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
            ),
            ),
            Container(
                width: 350,
                height: 50,
                
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(60))
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        obscureText: true,
                        decoration:  InputDecoration(

                          hintText: user.password,
                          focusColor: Colors.white,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20))),
                          
                        ),
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),

              SizedBox(height:20 ,),
              ElevatedButton(
                  onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0060FF), 
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: const SizedBox(
                    width: 350,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Update Information ', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),)
                      ],
                    ),
                  ),
                )

              
              ],
            ),
            
          ],
        ),
        ),
      ),
    );
  }
  PreferredSize _headerAccountCenter(){
    return PreferredSize(
      preferredSize: const Size.fromHeight(250),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Color(0xFF0060FF),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65)),
            ),
          ),
          Center(
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
                      width: 300,
                      child: Text('Account Center', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                    ),
                    
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(user.image),
                      ),
                    ),

                  ],

                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}