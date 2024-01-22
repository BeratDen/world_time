import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Athens', flag: 'germany.png'),
    WorldTime(url: 'Europe/Istanbul',location: 'Turkey', flag: 'usa.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Cairo', flag: 'kenya.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi', flag: 'indonesia.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York',location: 'New_York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(WorldTime worldTime) async {
    await worldTime.getTime();
    // Navigate to Home Screen
    Navigator.pop(context,{
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDayTime' : worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(locations[index]);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
