import 'package:flutter/material.dart';

class DevDetails extends StatefulWidget {
  @override
  _DevDetailsState createState() => _DevDetailsState();
}

class _DevDetailsState extends State<DevDetails> {
  @override
  Widget build(BuildContext context) {
    var detalis = ModalRoute.of(context).settings.arguments as List;

    return Scaffold(
      //------------------body--------------
      body: Column(
        children: [
          //------------up part------------------------------
          Container(
            margin: const EdgeInsets.only(top: 60, left: 10),
            height: 300,
            child: Row(
              children: [
                Container(
                    height: 300,
                    width: 200,
                    child: Image.network(
                      detalis[0],
                      fit: BoxFit.contain,
                    )),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(detalis[1]),
                          subtitle: Text("price : " + detalis[2])),
                    ],
                  ),
                )
              ],
            ),
          ),
          //--------------down part--------------------------------

          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0.1,
                childAspectRatio: 3,
              ),
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GridTile(
                      child: Row(
                        children: [
                          Icon(Icons.memory_outlined),
                          Text('  CPU: '),
                          Text(detalis[3]),
                        ],
                      ),
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.straighten),
                        Text('  Ram: '),
                        Text(detalis[4]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.sd_card),
                        Text('  تخزين:'),
                        Text(detalis[5]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.smartphone),
                        Text('شاشة:'),
                        Text(detalis[6]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt),
                        Text('كاميرا خلفيه:'),
                        Text(detalis[7]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('كاميرا اماميه:'),
                        Text(detalis[8]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.battery_std),
                        Text('بطاريه'),
                        Text(detalis[9]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        Text('نظام تشغيل'),
                        Text(detalis[10]),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GridTile(
                    child: Row(
                      children: [
                        Icon(Icons.sim_card),
                        Text(' SIM: '),
                        Text(detalis[11]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
