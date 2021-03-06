import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String? location; //location name for the UI
  String? time; //the time in that location
  String? flag; //url to an asset flag icon
  String? url; //this is the location url for api endpoint
  bool? isDayTime; //true or false if day time or not

  WorldTime(
      {this.location,
      this.flag,
      this.url});



  Future<void> getTime() async {

    try{
      //make request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      // print('Date Time\n$dateTime');
      //print('Offset\n$offset');

      //create date time object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Set the time property
      //from 7(am) to 20 (8pm) is day time, else night time
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught error $e');
      time = 'couldnt get time data';
    }



  }


}