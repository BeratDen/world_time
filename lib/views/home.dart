import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as dynamic;
    print(data);

    // set background

    String bgImage =
        data['isDayTime'] ?? data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ?? data['isDayTime']
        ? Colors.blue
        : Colors.indigo[700];
    Color? textColor = data['isDayTime'] ?? data['isDayTime']
        ? Colors.amber
        : Colors.blue[200];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime'],
                      } as dynamic;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: textColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: textColor),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0),
              )
            ],
          )),
        ),
      ),
    );
  }
}
