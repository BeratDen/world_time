import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDayTime' : worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitPouringHourGlass(
            color: Colors.white,
            size: 50,
          ),
          SizedBox(height: 20.0),
          Text('Loading...',style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
          ))
        ],
      ),
    );
  }
}
