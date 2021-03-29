import 'package:finalproject/screenTail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final contolerforrange = TextEditingController();
  @override
  Widget build(BuildContext context) {
        var i = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //--------------------------------TextField and IconButton----------------------------------------------------------------------
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: contolerforrange,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'put your money range ',
                  ),
                )),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if(contolerforrange.text==""){
          showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text("Alert !"),
              content: new Text("plese put your money range"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
                     }
                    else{  
                      List<dynamic> a=[i,contolerforrange.text];
                    Navigator.of(context)
                    .pushNamed(ScreenNameTile.nameRouote_companys ,arguments: a);
                 }
                 },
                ),
                
              ],
            ),
          ),
          //-------------------------------Hight-----------------------------------------------------------------------

          Center(
              child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            width: 240,
            height: 50,
            child:RaisedButton(
              child: Row(
                children: [
                  Icon(Icons.arrow_circle_up),
                  Text("   Hight"),
                ],
              ),
                onPressed: (){    
                      List a=[i,contolerforrange.text];
                      contolerforrange.text="999.999";
                      Navigator.of(context)
                      .pushNamed(ScreenNameTile.nameRouote_companys ,arguments: a);
                   contolerforrange.text="";
                   },
            color: Colors.deepOrangeAccent[700],
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.red[200],
              )
          )),
          //-----------------------------------medum-------------------------------------------------------------------

          Center(
              child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            width: 240,
            height: 50,
            child: RaisedButton(child: Row(
              children: [
              Icon(Icons.arrow_right_outlined),
                Text("   medum"),
              ],
            ),
                onPressed: (){  
                      List a=[i,contolerforrange.text];
                      contolerforrange.text="555.555";
                      Navigator.of(context)
                      .pushNamed(ScreenNameTile.nameRouote_companys ,arguments: a);
                   contolerforrange.text="";
                   },
            color: Colors.cyan,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.cyan[200],
              )
          )),
          //----------------------------------low--------------------------------------------------------------------

          Center(
              child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            width: 240,
            height: 50,
            child:RaisedButton(child: Row(
              children: [
                Icon(Icons.arrow_circle_down),
                Text("     low"),
              ],
            ),
                onPressed: (){ 
                        List a=[i,contolerforrange.text];
                      contolerforrange.text="111.111";
                      Navigator.of(context)
                      .pushNamed(ScreenNameTile.nameRouote_companys ,arguments: a);
                   contolerforrange.text="";},
            color: Colors.greenAccent,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.green[200],
              )
          )),
//-------------------------------------all phone-------------------------------------------
        
          Center(
            child: RaisedButton(child: Text("All Device"),
                  onPressed: (){ 
                      List<dynamic> a=[i,contolerforrange.text];
                      contolerforrange.text="";
                      print(i);
                      Navigator.of(context)
                      .pushNamed(ScreenNameTile.nameRouote_companys ,arguments:a);
                    },
                  color: Colors.red,
                  textColor: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.blue,
                ),
          )
          
        ],
      ),
    );
  }
}
