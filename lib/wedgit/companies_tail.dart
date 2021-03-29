import 'package:finalproject/model/list_Of_coompany.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompaniesTile extends StatefulWidget {
NameOfCompanies nameOfCompanies;
CompaniesTile(this.nameOfCompanies);

  @override
  _CompaniesTileState createState() => _CompaniesTileState();
}

class _CompaniesTileState extends State<CompaniesTile> {
  @override
  Widget build(BuildContext context) {

    return Card(
        shape: BeveledRectangleBorder(
     borderRadius: BorderRadius.circular(10.0),
  side: BorderSide(
    color: Colors.black54,
    width: 1.0,
  ),
),
      color: Colors.transparent,
      child: Container(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

        height: 90,         
        child: Row(children: [Container(width: 150, child: Image.asset(widget.nameOfCompanies.compimageURL,fit: BoxFit.fitHeight,)) 
        
        ,Expanded(child:
        
         Stack(
  children: <Widget>[
      // Stroked text as border.
      Text(
        widget.nameOfCompanies.commpany,
        style: TextStyle(
          fontSize: 30,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.grey[700],
        ),
      ),
      // Solid text as fill.
      Text(
        widget.nameOfCompanies.commpany,
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
  ],
)
        // Text(widget.nameOfCompanies.commpany,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20 ,) ,),
        ) ],
        ),
        
      ),
    );
  }
}