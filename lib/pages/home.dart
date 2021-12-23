import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data["isDayTime"] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body:  SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, "/location");
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      )
                  ),

                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: data['isDayTime'] ? Colors.black : Colors.white
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: data['isDayTime'] ? Colors.black : Colors.white

                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
