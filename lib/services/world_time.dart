import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag; //url to asset icon
  String url;
  bool isDayTime;


  WorldTime({this.location,this.flag,this.url});

   Future<void> getTime() async{
    try{
      http.Response response=await http.get('https://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);

      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));

      isDayTime=now.hour >6 && now.hour<20;
      time=DateFormat.jm().format(now);
    }catch(e){
      print("error: $e");
      time="Could not get the data";
    }
  }



}