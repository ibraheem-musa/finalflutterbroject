import 'package:finalproject/model/list_Of_coompany.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Companies with ChangeNotifier {
  List<NameOfCompanies> _companiessList = [
    NameOfCompanies(
        id: "0",
        commpany: "     Nokia",
        col: Colors.blue[900],
        compimageURL: "lib/Image/companies/Nokia_wordmark.svg.png"),

    NameOfCompanies(
        id: "1",
        commpany: "    samsung",
        col: Colors.blue,
        compimageURL: "lib/Image/companies/Samsung.png"),
    NameOfCompanies(
        id: "2",
        commpany: "    Apple",
        col: Colors.black,
        compimageURL: "lib/Image/companies/apple.png"),
    NameOfCompanies(
        id: "3",
        commpany: "    HUAWEI",
        col: Colors.red[900],
        compimageURL: "lib/Image/companies/3.png"),

    NameOfCompanies(
        id: "4",
        commpany: "    LG",
        col: Colors.red,
        compimageURL: "lib/Image/companies/4.png"),

    NameOfCompanies(
        id: "5",
        commpany: "     oppo",
        col: Colors.green,
        compimageURL: "lib/Image/companies/5.png"),

    NameOfCompanies(
        id: "6",
        commpany: "    ONE plus",
        col: Colors.red[600],
        compimageURL: "lib/Image/companies/6.png"),
//----------------------------------------------------
    NameOfCompanies(
        id: "7",
        commpany: "    Xiaomi",
        col: Colors.orange[800],
        compimageURL: "lib/Image/companies/7.png"),

    NameOfCompanies(
        id: "8",
        commpany: "    Realme",
        col: Colors.orange[300],
        compimageURL: "lib/Image/companies/8.png"),
    NameOfCompanies(
        id: "9",
        commpany: "    honor ",
        col: Colors.cyan,
        compimageURL: "lib/Image/companies/9.png"),
    NameOfCompanies(
        id: "10",
        commpany: "     Infinix",
        col: Colors.green[900],
        compimageURL: "lib/Image/companies/10.png"),
    NameOfCompanies(
        id: "11",
        commpany: "     Vivo",
        col: Colors.blueAccent,
        compimageURL: "lib/Image/companies/11.png"),
    NameOfCompanies(
        id: "12",
        commpany: "     Tecno ",
        col: Colors.blueAccent,
        compimageURL: "lib/Image/companies/12.png"),
    NameOfCompanies(
        id: "13",
        commpany: "    Motorola",
        col: Colors.cyan[400],
        compimageURL: "lib/Image/companies/13.png"),

    NameOfCompanies(
        id: "14",
        commpany: "    TCL",
        col: Colors.redAccent,
        compimageURL: "lib/Image/companies/14.png"),
    NameOfCompanies(
        id: "15",
        commpany: "    lenovo ",
        col: Colors.red,
        compimageURL: "lib/Image/companies/15.png"),
  ];

  List<NameOfCompanies> get companiessList {
    return [..._companiessList];
  }
}
