import 'package:clothes_app/screens/accountCenter.dart';
import 'package:clothes_app/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  _SettingsPage2State createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsScreen> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SingleSection(
                  title: "General",
                  children: [
                    _CustomListTile(
                        title: "Dark Mode",
                        icon: Icons.dark_mode_outlined,
                        trailing: Switch(
                            value: _isDark,
                            onChanged: (value) {
                              setState(() {
                                _isDark = value;
                              });
                            })),
                  ],
                ),
                const Divider(),
                _SingleSection(
                  title: "Organization",
                  children: [
                    _CustomListTile(title: "Profile", icon: Icons.person_outline_rounded, goto: AccountCenter(),),
                  ],
                ),
                const Divider(),
                _SingleSection(
                  children: [
                    const _CustomListTile(
                        title: "Help & Feedback",
                        icon: Icons.help_outline_rounded),
                    const _CustomListTile(
                        title: "About", icon: Icons.info_outline_rounded),
                    _CustomListTile(
                        title: "Sign out", icon: Icons.exit_to_app_rounded, goto: SignIn(),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final Widget? goto;
  const _CustomListTile({Key? key, required this.title, required this.icon, this.trailing, this.goto}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {
        if(goto!=null){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => goto!),
          );
        }
      },
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}


// class _SettingsState extends State<SettingsScreen> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: _headerSettingsApp(),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _titleBodyCustom(context, Icons.notifications, 'Notifications'),
//             _titleBodyCustom(context, Icons.lock, 'Privacy and Security'),
//             _titleBodyCustom(context, Icons.headphones, 'Help & Support'),
//             _titleBodyCustom(context, Icons.help, 'About'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _titleBodyCustom(BuildContext context, IconData icon, String title){
//     Widget widget = SettingsScreen();
//     return GestureDetector(
//       onTap: (){
//         // Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
//       },

//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.only(bottom: 10),
//         margin: EdgeInsets.only(bottom: 30),

//         decoration: const BoxDecoration(
//           border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
//         ),

//         child: Row(
//           children: [
//             Expanded(
//               flex: 0,
//               child: Icon(icon, size: 30, color: Colors.black,)
//             ),
//             const SizedBox(width: 10,),
//             Expanded(
//               flex: 5,
//               child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),)
//             ),
//             Expanded(
//               flex: 1,
//               child: Icon(Icons.arrow_forward_ios, size: 20,)
//             )
//           ],
//         )
//       ),
//     );
//   }

//   PreferredSize _headerSettingsApp(){
//     return PreferredSize(
//         preferredSize: Size.fromHeight(170.0),
        
//         child: Stack(
//           children: [
//              Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//             ),
//             GestureDetector(
//               onTap: (){
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 width: 100,
//                 height: double.infinity,
//                 margin: const EdgeInsets.only(bottom: 20),
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
//                   color: Color(0xFF0060FF),
//                 ),

//                 child: const Positioned(
//                     bottom: 10,
//                     left: 30,
//                     child: Icon(Icons.arrow_back, color: Colors.white, size: 40,),
//                   )
//                 ),
//             )
//           ],
//         )
//       );
//   }

// }