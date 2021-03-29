import 'package:finalproject/provaider/autheraizaton_prov.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Signupscreen extends StatefulWidget {
  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
    var signupkey = GlobalKey<FormState>(); 

    String username;
    String passowrd;
    String old;
    String city;
    String email;

     Future<void> addnewphone() async {
    if (signupkey.currentState.validate()) {
      signupkey.currentState.save();

  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue[50],

     body: 
     ListView(
       children: [
         Container(
      padding: EdgeInsets.only(left: 10, top: 20, right: 10),
           child: Form( key: signupkey,
            child:Wrap(
              runSpacing: 20,
               children: [
//-------------------name-----------------------------
  TextFormField(
                              decoration: InputDecoration(
                                labelText: "enter your name",
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "this value is mandatory";
                                }
                                return null;
                              },
                              onSaved: (newvalue) {
                                username = newvalue;
                              },
                            ),
//-------------------passowrd-----------------------------
                          
TextFormField(
                              decoration: InputDecoration(
                                labelText: "enter your passowrd",
                                icon: Icon(Icons.vpn_key_outlined),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "this value is mandatory";
                                }
                                return null;
                              },
                              onSaved: (newvalue) {
                                passowrd = newvalue;
                              },
                            ),
//-------------------email-----------------------------

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "enter your email",
                                icon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "this value is mandatory";
                                }
                                return null;
                              },
                              onSaved: (newvalue) {
                                email = newvalue;
                              },
                            ),
//-------------------age-----------------------------
                            
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "enter Your age ",
                                icon: Icon(Icons.perm_identity),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "this value is mandatory";
                                }
                                return null;
                              },
                              onSaved: (newvalue) {
                                old = newvalue;
                              },
                            ),
//-------------------city-----------------------------

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "enter Your city",
                                icon: Icon(Icons.person_pin_circle_sharp),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "this value is mandatory";
                                }
                                return null;
                              },
                              onSaved: (newvalue) {
                                city = newvalue;
                              },
                            ),
 //-----------------------------raized-------------------------------
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 20, right: 100),
                      child: Center(
                        child: RaisedButton(child: Row(
              children: [
            
                Text("  Sign up  "),
              ],
            ),
                onPressed: () async {
                     var userauthRes =await Provider.of<AuthenticationProvider>(context ,listen: false).getLoginfromuser( email,passowrd);



   addnewphone().then((valu) {
                                      
                                        
                                        http.post(
                                          'https://your-future-phone-default-rtdb.firebaseio.com/users.json',
                                          body: json.encode(
                                            {
                                             'username':username,
                                             'password':passowrd,
                                             'E-mail':email,
                                             'old':old,
                                             'city':city
                                            },
                                          ),
                                        ) .then((sd) {
                                              Navigator.of(context).pop();

                                        });
                                      });

// }else{showDialog(
//         context: context,
//         builder: (_) => new CupertinoAlertDialog(
          
//               title: new Text("Alert !"),
//               content: new Text("incorrect E-mail or valid account please try with other E-mail"),
//               actions: <Widget>[
//                 FlatButton(
//                   child: Text('Close'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             ));}
                       
                          }, 
            color: Colors.purple[300],
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                splashColor: Colors.cyan[200],
              ),
                      ),
                    ),
                    
                     

],),),
         ),
       ],
     )


     
      
    );
  }
}