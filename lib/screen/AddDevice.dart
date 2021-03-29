// import 'package:finalproject/screenTail.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class AddDevice extends StatefulWidget {
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  //----------------------------mood part---------------------------------------
  var formKey = GlobalKey<FormState>();
  String fName;
  double fPrice;
  String fCPU;
  String fRAM;
  String fStorageSize;
  String fFrontCamera;
  String fBackCamera;
  String fScreen;
  String fOperatingsystem;
  String fBattery;
  String fSIM;
  String fImageURL;

var imageURLfromdata;  
  bool isLoding = false;
//------------------fun-----------------------

  File images;
  final imagepikaer=ImagePicker();
//-----------------------------------
 getimages()async{
 final pickeFileimage =await imagepikaer.getImage(source: ImageSource.gallery);
 setState(() {
    images =File(pickeFileimage.path);
  });
 }
//-----------------------------------
Future<String> uploudimages()async{
  var imagename= DateTime.now().millisecondsSinceEpoch.toString();
  var fierStoregref =FirebaseStorage.instance.ref().child('uploud/$imagename');
  var uploudTask =await fierStoregref.putFile(images);
  var downlodeURL = uploudTask.ref.getDownloadURL();
  return downlodeURL;

}


//---------------------------------------------

  Future<void> addnewphone() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
       imageURLfromdata = await uploudimages();
           }
    }
 


//----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    var compannyID = ModalRoute.of(context).settings.arguments as int;

    return Scaffold(
        //-------------------------app bar------------------------------------------------

        appBar: AppBar(
          title: Text('Add Device'),
          centerTitle: true,
        ),

        //-----------------body-----------------------------------------
        body: ListView(
          children: [
            //---------------------------------------------
            Row(
              children: [
                images == null
                    ? Expanded(
                        child: 
                             Center(
                                child: RaisedButton(
                              onPressed: () {
                                 getimages();
                              },
                              child: Text("add Image"),
                            )),
                         
                      )
                    : Container(
                        height: 300,
                        width: 200,
                        child: Image.file(
                          images,
                          fit: BoxFit.contain,
                        ))
              ],
            ),
            //-----------------------------------------------------------------
            Container(
              padding: EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    runSpacing: 20,
                    children: [
                      //------------enter device name------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "enter device name",
                          icon: Icon(Icons.smartphone),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fName = newvalue;
                        },
                      ),
                      //----------------Price---------------------------SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Price",
                          icon: Icon(Icons.monetization_on_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fPrice = double.parse(newvalue);
                        },
                      ),
                      //---------------CPU----------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "CPU",
                          icon: Icon(Icons.memory_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fCPU = newvalue;
                        },
                      ),
                      //----------------RAM---------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "RAM",
                          icon: Icon(Icons.straighten),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fRAM = newvalue;
                        },
                      ),
                      //----------------storage size---------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "storage size",
                          icon: Icon(Icons.sd_card),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fStorageSize = newvalue;
                        },
                      ),
                      //-----------------Front Camera--------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "front Camera",
                          icon: Icon(Icons.camera),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fFrontCamera = newvalue;
                        },
                      ),
                      //-----------------Back Camera--------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Back Camera",
                          icon: Icon(Icons.camera_alt),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fBackCamera = newvalue;
                        },
                      ),
                      //------------------screen-------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Screen",
                          icon: Icon(Icons.smartphone),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fScreen = newvalue;
                        },
                      ),
                      //-----------------Operating system--------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Operating system",
                          icon: Icon(Icons.settings),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fOperatingsystem = newvalue;
                        },
                      ),
                      //------------------Battery-------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Battery",
                          icon: Icon(Icons.battery_std),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fBattery = newvalue;
                        },
                      ),
                      //-----------------SIM--------------------------
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "SIM",
                          icon: Icon(Icons.sim_card),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "this value is mandatory";
                          }
                          return null;
                        },
                        onSaved: (newvalue) {
                          fSIM = newvalue;
                        },
                      ),
                                        
                      //-------------------------------------------

                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            if(images!=null){     
    addnewphone().catchError((eroro) {}).then((valu) {
                              setState(() {
                                isLoding = true;
                              });
                              
                              http
                                  .post(
                                'https://your-future-phone-default-rtdb.firebaseio.com/devices.json',
                                body: json.encode(
                                  {
                                    'companieid': compannyID.toString(),
                                    'devicename': fName,
                                    'deviceURL': imageURLfromdata,
                                    'deviceprice': fPrice,
                                    'cpu': fCPU,
                                    'storagememory': fStorageSize,
                                    'ram': fRAM,
                                    'frontcamera': fFrontCamera,
                                    'backcamera': fBackCamera,
                                    'screen': fScreen,
                                    'os': fOperatingsystem,
                                    'battery': fBattery,
                                    'sim': fSIM,
                                  },
                                ),
                              )
                                  .then((sd) {
                                setState(() {
                                  isLoding = false;
                                  Navigator.of(context).pop();
                                  // Navigator.of(context).pushNamed(ScreenNameTile.nameRouote_Device );
                                });
                              });
                            });
                         
                              }else{
        showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text("Alert"),
              content: new Text("Please insert image ,up"),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
                                  }


                            
                          },
                          child: Container(
                              child: Text('add device',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan))),
                          color: Colors.grey[350],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
