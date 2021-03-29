import 'package:finalproject/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  String idToken;
  DateTime expiryDate;
  String userId;
  bool ignorsin;
  static const String webKey = 'AIzaSyCAmIJzGCV5lO2n7DqrNcyDBIqrHltsb_s';

  // Future<void> setAuthData() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('userId', userId);
  //   await prefs.setString('idToken', idToken);
  //   await prefs.setInt('expiryDate', expiryDate.millisecondsSinceEpoch);
  //   notifyListeners();
  // }

  // Future<void> saveUserInDatabase(
  //   String email,
  //   double lat,
  //   double lon,
  //   String userName,
  //   String phoneNumber,
  //   String token,
  // ) async {
  //   print(token);
  //   final url =
  //       'https://food-5880a-default-rtdb.firebaseio.com/users/$userId.json?auth=$token';
  //   var res = await http.patch(
  //     url,
  //     body: json.encode(
  //       {
  //         'email': email,
  //         'latitude': lat,
  //         'longitude': lon,
  //         'username': userName,
  //         'phoneNumber': phoneNumber,
  //       },
  //     ),
  //   );
  //   print(res.body);
  // }

  // Future<bool> isAuthenticated() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   userId = prefs.getString('userId');
  //   if (userId != null) {
  //     idToken = prefs.getString('idToken');
  //     expiryDate =
  //         DateTime.fromMillisecondsSinceEpoch(prefs.getInt('expiryDate'));
  //     notifyListeners();
  //     print('inside is authenticated');
  //     return (idToken != null && DateTime.now().isBefore(expiryDate));
  //   } else {
  //     return false;
  //   }
  // }

  // Future<bool> signUp(
  //   String email,
  //   String password,
  //   double lat,
  //   double lon,
  //   String userName,
  //   String phoneNumber,
  // ) async {
  //   final url =
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$webKey';

  //   try {
  //     var res = await http.post(
  //       url,
  //       body: json.encode(
  //         {
  //           'email': email,
  //           'password': password,
  //           'returnSecureToken': true,
  //         },
  //       ),
  //     );
  //     var jsonString = json.decode(res.body);
  //     userId = jsonString['localId'];
  //     idToken = jsonString['idToken'];
  //     expiryDate = DateTime.now()
  //         .add(Duration(seconds: int.parse(jsonString['expiresIn'])));
  //     // await setAuthData();
  //     await saveUserInDatabase(email, lat, lon, userName, phoneNumber, idToken);
  //     return true;
  //   } catch (err) {
  //     return false;
  //   }
  // }

//--------------------------------------------------------------------
 
 Future <bool> getLoginfromuser (String emailinput ,String passowordinput) async {
    var url='https://your-future-phone-default-rtdb.firebaseio.com/devices.json';
    var res =await http.get(url);
    var jsonResult =json.decode(res.body)as Map<String,dynamic>;
        List <String> tempList =[];

    jsonResult.forEach((key,value){
      Usermodel tempuser=Usermodel(
         passowrd: value['password'],
         email: value['E-mail']
      );
        if(emailinput==tempuser.email&&passowordinput==tempuser.passowrd)
        { 
          tempList.add(tempuser.email);
         
        
          }
     
    }); 
      if(tempList==null){
 notifyListeners();
    return false;
      }else{
         notifyListeners();
    return true;
      }
  
  }

//--------------------------------------------------------------------

  Future<bool> signIn(String email, String password) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$webKey';

    try {
      var res = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      var jsonString = json.decode(res.body);
      userId = jsonString['localId'];
      idToken = jsonString['idToken'];
      expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(jsonString['expiresIn'])));
      // await setAuthData();

      return true;
    } catch (err) {
      return false;
    }
  }
}
