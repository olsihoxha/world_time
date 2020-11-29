import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage=data['isDayTime'] ? 'day.png':'night.png';
    Color bg=data['isDayTime'] ? Colors.blue:Colors.indigo[300];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$bgImage"),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async{
                         dynamic result=await Navigator.pushNamed(context, "/location");
                         setState(() {
                           data={
                             'time': result['time'],
                             'location': result['location'],
                             'isDayTime': result['isDayTime'],
                             'flag': result['flag']
                           };
                         });
                      },
                      icon: Icon(Icons.edit_location,
                        color: Colors.grey[300]
                      ),
                      label: Text("Edit Location",
                      style: TextStyle(
                        color:Colors.grey[300]
                      ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.grey[300]
                      ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(height: 20,),
                  Text(data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.grey[300]
                  ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
