import 'package:finalproject/provaider/copany_prov.dart';
import 'package:finalproject/screenTail.dart';
import 'package:finalproject/wedgit/companies_tail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompaniesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arguForSalaryRange = ModalRoute.of(context).settings.arguments as List;

    Companies com = Provider.of<Companies>(context);
    // int arguForSalaryRangetoINT =int.parse(arguForSalaryRange);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Phones Companies "),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/Image/dev_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        //------------ListView----------------------
        child: ListView.builder(
          itemBuilder: (_, i) {
            return GestureDetector(
                onTap: () {
                  List <dynamic>ads = [
                    i,
                    arguForSalaryRange[1],
                    com.companiessList[i].commpany,
                    com.companiessList[i].col,
                     arguForSalaryRange[0]
                  ];
                  print(arguForSalaryRange[0]);
                  
                  Navigator.of(context).pushNamed(
                      ScreenNameTile.nameRouote_Device,
                      arguments: ads);
                },
                child: CompaniesTile(com.companiessList[i]));
          },
          itemCount: com.companiessList.length,
        ),
      ),
    );
  }
}
