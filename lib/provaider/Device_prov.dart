import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/list_OF_Device.dart';
import 'package:flutter/cupertino.dart';

class ListNameOfDevices with ChangeNotifier {
  List<NameOfDevice> _nameOfDevice = [
   
    // NameOfDevice(
    //      id:'0',
    //      companieid:'0',
    //      devicename:'Samsung Galaxy F41',
    //      deviceURL:"https://i.gadgets360cdn.com/products/large/samsung-galaxy-f41-380x800-1602163723.jpg?downsize=*:180&output-quality=80&output-format=webp",
    //      deviceprice:0,
    //      cpu:'kairen', 
    //      storagememory:'64', 
    //      ram:'6', 
    //     frontcamera:'8mpix',
    //     backcamera:'12mpix+16mpix',
    //      screen:'gorila', 
    //      os:'marshmelo', 
    //      battery:'3500', 
    //      sim:'dul'),

        //  NameOfDevice(
        //  id:'1',
        //  companieid:"0",
        //  devicename:'Samsung Galaxy Z Fold 2',
        //  deviceURL: "https://i.gadgets360cdn.com/products/large/samsung-galaxy-z-fold-2-550x800-1596692058.jpg?downsize=*:180&output-quality=80&output-format=webp",
        //  deviceprice:0,
        //  cpu:'kiran suber omelat gfg', 
        //  storagememory:'124', 
        //  ram:'4', 
        // frontcamera:'12mp',
        // backcamera:'48mp+24mp',
        //  screen:'5.6 e', 
        //  os:'marsimelo', 
        //  battery:'3500', 
        //  sim:'dual'),
    //      NameOfDevice(
    //      id:'2',
    //      companieid:"1",
    //      devicename:'Samsung Galaxy M51 ',
    //      deviceURL: "https://i.gadgets360cdn.com/products/large/Galaxy-M51-DB-388x800-1598857610.jpg?downsize=*:180&output-quality=80&output-format=webp",
    //      deviceprice:0,
    //      cpu:'', 
    //      storagememory:'', 
    //      ram:'', 
    //     frontcamera:'',
    //     backcamera:'',
    //      screen:'', 
    //      os:'', 
    //      battery:'', 
    //      sim:''),
    //       NameOfDevice(
    //      id:'2',
    //      companieid:"1",
    //      devicename:'Samsung Galaxy Note 20 Ultra 5G ',
    //   deviceURL: "https://i.gadgets360cdn.com/products/large/samsung-galaxy-note-20-ultra-375x800-1596639312.jpg?downsize=*:180&output-quality=80&output-format=webp",
    //      deviceprice:0,
    //      cpu:'', 
    //      storagememory:'', 
    //      ram:'', 
    //     frontcamera:'',
    //     backcamera:'',
    //      screen:'', 
    //      os:'', 
    //      battery:'', 
    //      sim:''),

   
  ];

  List<NameOfDevice> get nameOfDevice {
    return [..._nameOfDevice];
  }

  Future <void> getdevaisfromaoi () async {
    var url='https://your-future-phone-default-rtdb.firebaseio.com/devices.json';
    var res =await http.get(url);
    var jsonResult =json.decode(res.body)as Map<String,dynamic>;
    List <NameOfDevice> tempList =[];

    jsonResult.forEach((key,value){
      NameOfDevice tempShop=NameOfDevice(
          id:value['id'],
         companieid:value['companieid'],
         devicename:value['devicename'],
         deviceURL:value['deviceURL'],
         deviceprice:value['deviceprice'],
         cpu:value['cpu'],
         storagememory:value['storagememory'], 
         ram:value['ram'], 
        frontcamera:value['frontcamera'],
        backcamera:value['backcamera'],
         screen:value['screen'],
         os:value['os'], 
         battery:value['battery'], 
         sim:value['sim'],
      );
tempList.add(tempShop);
    });
    _nameOfDevice=tempList;
    notifyListeners();
  }
  
}

