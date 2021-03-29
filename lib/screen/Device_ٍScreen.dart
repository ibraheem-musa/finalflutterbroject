import 'package:finalproject/model/list_OF_Device.dart';
import 'package:finalproject/provaider/Device_prov.dart';
import 'package:finalproject/screenTail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  void initState() {
    gett();
    super.initState();
  }

  void gett() async {
    await Provider.of<ListNameOfDevices>(context, listen: false)
        .getdevaisfromaoi();
  }

  @override
  Widget build(BuildContext context) {
    var i = ModalRoute.of(context).settings.arguments as List;
    ListNameOfDevices devaices = Provider.of<ListNameOfDevices>(context);
    bool a;
    bool love = true;
    if (i[4] == 'false') {
      a = true;
    } else {
      a = false;
    }
    List<NameOfDevice> filtarengg;
    List<NameOfDevice> filtrgy;

//-------------------------startFiltaring-------------------------------------------------------------

    if (i[1] == "") {
      filtrgy = devaices.nameOfDevice;
      filtarengg = filtrgy.where((elemnt2) {
        return elemnt2.companieid == i[0].toString();
      }).toList();
    } else {
      if (i[1] == "999.999") {
        filtrgy = devaices.nameOfDevice.where((element) {
          return element.deviceprice <= 1000 + 5000 &&
              element.deviceprice >= 1000 - 600;
        }).toList();
        filtarengg = filtrgy.where((elemnt2) {
          return elemnt2.companieid == i[0].toString();
        }).toList();
      } else {
        if (i[1] == "555.555") {
          filtrgy = devaices.nameOfDevice.where((element) {
            return element.deviceprice <= 500 && element.deviceprice >= 100;
          }).toList();
          filtarengg = filtrgy.where((elemnt2) {
            return elemnt2.companieid == i[0].toString();
          }).toList();
        } else {
          if (i[1] == "111.111") {
            filtrgy = devaices.nameOfDevice.where((element) {
              return element.deviceprice <= 150 && element.deviceprice >= -10;
            }).toList();
            filtarengg = filtrgy.where((elemnt2) {
              return elemnt2.companieid == i[0].toString();
            }).toList();
          } else {
            int hi = int.parse(i[1]);
            filtrgy = devaices.nameOfDevice.where((element) {
              return element.deviceprice <= hi + 50 &&
                  element.deviceprice >= hi - 50;
            }).toList();
            filtarengg = filtrgy.where((elemnt2) {
              return elemnt2.companieid == i[0].toString();
            }).toList();
          }
        }
      }
    }

//--------------------------------endFiltaring------------------------------------------------------

    return Scaffold(
      appBar: AppBar(
        backgroundColor: i[3],
        title: Text(i[2].toString()),
        centerTitle: true,
      ),
      //---------------------GridView for phones---------------------
      body: Container(
        color: Colors.deepPurple[100],
        child: GridView.builder(
          itemCount: filtarengg.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 4 / 7,
          ),
          // ignore: missing_return
          itemBuilder: (_, index) {
            //-----------------------------------

            return GestureDetector(
                //-----------------on gread tab----------------------------
                onTap: () {
                  List details = [
                    filtarengg[index].deviceURL,
                    filtarengg[index].devicename,
                    filtarengg[index].deviceprice.toString(),
                    filtarengg[index].cpu,
                    filtarengg[index].ram,
                    filtarengg[index].storagememory,
                    filtarengg[index].screen,
                    filtarengg[index].backcamera,
                    filtarengg[index].frontcamera,
                    filtarengg[index].battery,
                    filtarengg[index].os,
                    filtarengg[index].sim,
                  ];
                  Navigator.of(context).pushNamed(
                      ScreenNameTile.nameRouote_CeviceD,
                      arguments: details);
                },
                child: Card(
                  elevation: 3,
                  child: GridTile(
                    child: Image.network(
                      filtarengg[index].deviceURL,
                      fit: BoxFit.scaleDown,
                    ),
                    header: Container(
                        height: 30,
                        color: Colors.purple[50],
                        child: Row(
                          children: [
                            Center(
                                child: Text(
                              filtarengg[index].devicename,
                            )),
                            Spacer(),
                            //------------------------------------------
                            IconButton(

                                onPressed: () {
                                  print(!love);
                                  setState(
                                    () {
                                      love = !love;
                                    },
                                  );
                                },
                                icon: Icon(
                                 love
                                    ? Icons.favorite
                                    : Icons.favorite_border)
                                    
                                    )
                          ],
                        )),
                    footer: Container(
                        height: 20,
                        color: i[3],
                        child: Center(
                            child: Text(
                          filtarengg[index].deviceprice.toString() + "  JD",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                ));
          },
        ),
      ),
//---------------------------flat------------
      floatingActionButton: a
          ? null
          : new FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    ScreenNameTile.nameRouote_AddDevice,
                    arguments: i[0]);
              },
              child: new Icon(Icons.add),
              backgroundColor: Colors.cyan,
            ),
    );
  }
}
