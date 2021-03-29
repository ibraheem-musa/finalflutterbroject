import 'package:finalproject/provaider/autheraizaton_prov.dart';
import 'package:finalproject/screenTail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var loginformkey = GlobalKey<FormState>();

  String fName;
  String fPassowrd;
//----------------------------------------------------

void addnewphone()  async {

if(!loginformkey.currentState.validate()){
return null;
}else{    
loginformkey.currentState.save();
var authRes =await Provider.of<AuthenticationProvider>(context ,listen: false).signIn(fName ,fPassowrd);
var userauthRes =await Provider.of<AuthenticationProvider>(context ,listen: false).getLoginfromuser(fName ,fPassowrd);

if(authRes){
      String a ='true';

              Navigator.of(context).pushReplacementNamed(
                   ScreenNameTile.nameRouote_HomeScreen,arguments: a);
}else{
  if(userauthRes){
  String a ='false';
      Navigator.of(context).pushReplacementNamed(
                   ScreenNameTile.nameRouote_HomeScreen,arguments:a );
                   
  }else{
      showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
          
              title: new Text("Alert !"),
              content: new Text("incorrect account please try again or sign up"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}}
}
  
 //---------------------------
  @override
  Widget build(BuildContext context) {

    // double height = MediaQuery.of(context).size.height;

    return  Stack(
        children: [
          //-----------------backgrond-----------------------
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/Image/Loginbackgroun.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //-----------------Scaffold-----------------------
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  //------------Expanded--------
                Spacer(flex: 5,),
                  //----------container for form -------------
                  Container(
                    
                    //----------------Form for input--------------------
                    child: Form(
                      key: loginformkey,
                      child: Wrap(
                        runSpacing: 10,
                        children: [
                          //-----------Theme for TextFormFields---------------------      
                          Theme(
                            data: ThemeData(
                              primaryColor: Colors.black,
                              focusColor: Colors.grey,
                              hintColor: Colors.black,
                            ),
                            child: Wrap(
                              runSpacing: 10,
                              children: [
                               //-----------enter your username---------------------           
                                TextFormField(
                                  style: TextStyle(color: Colors.pink),
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "enter your username",
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                  ),
                             validator: (value){
                        if (value.isEmpty) {
                          return "this value is mandatory";
                        }
                        return null;
                      },
                      onSaved: (newvalue){
                      fName=newvalue;
                      },

                                ),
                               //-----------enter your passowrd---------------------           

                                TextFormField(
                                  style: TextStyle(color: Colors.pink),
                                  decoration: InputDecoration(
                                    labelText: "enter your passowrd",
                                    icon: Icon(
                                      Icons.vpn_key_sharp,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                               validator: (value){
                        if (value.isEmpty) {
                          return "this value is mandatory";
                        }
                        return null;
                      },
                      onSaved: (newvalue){
                      fPassowrd=newvalue;
                      },

                                ),
                              ],
                            ),
                          ),
                    //-----------end Theme for TextFormFields---------------------      

                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                     //-----------RaisedButton login---------------------           
                                RaisedButton(
                                    color: Colors.deepPurple,
                                    //----------------------
                                    onPressed: () {
                                    addnewphone(); 
                                      // Navigator.of(context).pushNamed(
                                      //     ScreenNameTile.nameRouote_HomeScreen);
                                    },
                                    //----------------------
                                    child: Text('Log in',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.cyan))),
                     //--------------sizebox-----------------------------            
                                SizedBox(width: 20),
                    //-----------Text  'or'--------------------- 
                                Text("or", style: TextStyle(fontSize: 20)),
                    //--------------sizebox-----------------------------            
                                SizedBox(width: 20),
                    //-----------RaisedButton sign up---------------------           

                                RaisedButton(
                                    color: Colors.deepPurple,
                                   //----------------------
                                    onPressed: () {  Navigator.of(context).pushNamed(
                   ScreenNameTile.nameRouote_Signup); },
                                  //----------------------
                                    child: Text('sign up',
                                    style: TextStyle(fontSize: 20, color: Colors.cyan)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                                  Spacer(flex: 1,),

                ],
              ),
            ),
          ),
        ],
      );
    
  }
}
