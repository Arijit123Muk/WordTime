import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;// receive data through arguments from loading.dart

    String isDay = data['Day']? 'day.png':'night.png';
    Color bgColor = data['Day']? Colors.lightBlue : Colors.deepPurple;
    return Scaffold(
      backgroundColor: bgColor,
       body: SafeArea(
           child:Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/$isDay'),
                     fit: BoxFit.cover,
                   )
                 ),
             child: Padding(
               padding: const EdgeInsets.fromLTRB(20.0,80.0,20.0,10.0),
               child: Column(
                 children: <Widget>[
                 FlatButton.icon(
                     onPressed: () async {
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       if(result != null){
                         setState(() {
                           data = {
                             'time': result['time'],
                             'location': result['location'],
                             'Day': result['Day'],
                             'flag': result['flag']
                           };
                         });
                       }
                     },
                   icon: Icon(Icons.location_on),
                   label: Text('Edit Location',
                         style: TextStyle(
                           color:Colors.black87,
                         ))
                 ),
                 SizedBox(height: 10.0,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                   Text(
                     data['location'],
                     style: TextStyle(
                       fontSize: 28.0,
                     ),
                   )
                 ],
               ),
                   SizedBox(height: 10.0,),
                   Text(
                     data['time'],
                     style: TextStyle(
                       fontSize: 66.0,
                     ),
                   )
         ],
       ),
             ),
           )),
    );
  }
}
