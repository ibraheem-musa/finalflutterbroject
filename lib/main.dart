import 'package:finalproject/provaider/Device_prov.dart';
import 'package:finalproject/provaider/autheraizaton_prov.dart';
import 'package:finalproject/provaider/copany_prov.dart';
import 'package:finalproject/screen/AddDevice.dart';
import 'package:finalproject/screen/Devaice_detales.dart';
import 'package:finalproject/screen/Device_%D9%8DScreen.dart';
import 'package:finalproject/screen/HomScreen.dart';
import 'package:finalproject/screen/Log_in_screen.dart';
import 'package:finalproject/screen/company_screen.dart';
import 'package:finalproject/screen/sign_up_new_user.dart';
import 'package:finalproject/screenTail.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
             ChangeNotifierProvider.value( value: Companies(),),
             ChangeNotifierProvider.value( value: ListNameOfDevices(),),
             ChangeNotifierProvider.value( value: AuthenticationProvider(),),

    ],
    child: MaterialApp(
                debugShowCheckedModeBanner: false,

      initialRoute: '/',
      
      routes: {
        '/' : (ctx)=> Loginscreen(),
        ScreenNameTile.nameRouote_HomeScreen :(ctx)=> HomeScreen(), 
        ScreenNameTile.nameRouote_Device : (ctx)=> DeviceScreen(),
        ScreenNameTile.nameRouote_AddDevice : (ctx)=> AddDevice(),
        ScreenNameTile.nameRouote_CeviceD : (ctx)=> DevDetails(),
        ScreenNameTile.nameRouote_companys : (ctx)=> CompaniesScreen(),
        ScreenNameTile.nameRouote_Signup : (ctx)=> Signupscreen(),

      },
      )

    )
    
    
        
         ;
  }
}
