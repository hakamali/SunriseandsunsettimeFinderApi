import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  Map data = await getAllData();
  print("Sunrise time is:" + data['status']);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Sunrise and Sunset'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(),
      body: Container(
        height: 900.0,
        child: Stack(
          children: <Widget>[
            Container(
              height: 500.0,
              child: Image(
                image: AssetImage("asset/sun.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 50.0,
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: 340.0,
                height: 150.0,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Sunrise Time:" + data['results']['sunrise'],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Sunset Time:" + data['results']['sunset'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Solar Noon:" + data['results']['solar_noon'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ));
}

Future<Map> getAllData() async {
  var api = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400";
  var data = await http.get(api);
  var jsonData = json.decode(data.body);

  return jsonData;
}
