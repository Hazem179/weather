import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:weather/Ui.dart';

final appId = '273ebbc0a2664a77b0c132545193006';
final defaultcity = 'cairo';

Future<Map> getweather(String appId, String city) async {
  String apiurl = 'http://api.apixu.com/v1/current.json?key=$appId&q=$city';
  http.Response response = await http.get(apiurl);
  return jsonDecode(response.body);
}

Widget updatecountry(String city) {
  return FutureBuilder(
    future: getweather(appId, city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      if (snapshot.hasError) {
        print("wait");
      } else {
        if (snapshot.hasData) {
          Map cont = snapshot.data;
          return Container(
            child: Text(
              cont['location']['country'].toString(),
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Franco',
                  fontWeight: FontWeight.w400),
            ),
          );
        } else {
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }
      }
    },
  );
}

Widget updatecity(String city) {
  return FutureBuilder(
    future: getweather(appId, city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      if (snapshot.hasError) {
        print("wait");
      } else {
        if (snapshot.hasData) {
          Map cont = snapshot.data;
          return Container(
            child: Text(
              cont['location']['name'].toString(),
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Franco',
                  fontWeight: FontWeight.w200),
            ),
          );
        } else {
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }
      }
    },
  );
}

Widget updatetime(String city) {
  return FutureBuilder(
    future: getweather(appId, city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      if (snapshot.hasError) {
        print("wait");
      } else {
        if (snapshot.hasData) {
          Map cont = snapshot.data;
          return Container(
            child: Text(
              cont['location']['localtime'].toString(),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.w200),
            ),
          );
        } else {
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }
      }
    },
  );
}

Widget updatetemp(String city) {
  return FutureBuilder(
    future: getweather(appId, city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      if (snapshot.hasError) {
        print("wait");
      } else {
        if (snapshot.hasData) {
          Map cont = snapshot.data;
          return Container(
            child: Text(
              cont['current']['temp_c'].toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Franco',
                  backgroundColor: Colors.indigo[200],
                  fontSize: 25),
            ),
          );
        } else {
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }
      }
    },
  );
}

Widget updatetxt(String city) {
  return FutureBuilder(
    future: getweather(appId, city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      if (snapshot.hasError) {
        print("wait");
      } else {
        if (snapshot.hasData) {
          Map cont = snapshot.data;
          return Container(
            child: Text(
              cont['current']['condition']['text'].toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Franco',
                  backgroundColor: Colors.indigo[200],
                  fontSize: 25),
            ),
          );
        } else {
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }
      }
    },
  );
}

