import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'api.dart';

class Ui extends StatefulWidget {
  @override
  _UiState createState() => _UiState();
}

class _UiState extends State<Ui> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: conts(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.jpg'), fit: BoxFit.cover)),
    );
  }
}

class conts extends StatefulWidget {
  @override
  _contsState createState() => _contsState();
}

class _contsState extends State<conts> {
final TextEditingController cit= TextEditingController();

   String city1='';
void btn(){
  setState(() {
   city1=cit.text; 
  });
}
  void showcity() async {
    Map data = await getweather(appId, defaultcity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cit,
                style: TextStyle(
                    fontFamily: 'Franco',
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "City",
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.blue,
                    )),
              ),
              
            ),
            FlatButton(color: Colors.indigo[200],onPressed: btn,child: Text("OK"),)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: updatecountry(city1)
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: updatecity(city1),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 150.0),
          child: updatetime(city1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      "Temperature",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          backgroundColor: Colors.indigo[200],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  updatetemp(city1),
                  updatetxt(city1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
