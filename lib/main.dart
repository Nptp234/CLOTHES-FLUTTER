
import 'package:clothes_app/menus/bottom_menu.dart';
import 'package:clothes_app/objects/cartVM.dart';
import 'package:clothes_app/objects/productvm.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:clothes_app/screens/signin.dart';
import 'package:clothes_app/screens/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: BottomMenu(child: HomePage(),)
        home: SignIn()
      ),
    );
    
  }
}
