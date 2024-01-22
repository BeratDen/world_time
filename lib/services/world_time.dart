import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the ui
  String? time; // the time in that location
  String flag; // url to asset flag icon
  String url; // location url for api endpoint
  bool? isDayTime; // true or false is day time or not

  WorldTime(
      {required this.location,
      this.time,
      required this.flag,
      required this.url,
      this.isDayTime});

  Future<void> getTime() async {
    try {
      var url = Uri.http('worldtimeapi.org', '/api/timezone/${this.url}');

      // make the request
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String datetime = data['datetime'];
      String utcOffset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(utcOffset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utcOffset)));

      // set the time propety
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error : $e');
      time = 'could not get time data';
      isDayTime = false;
    }
  }
}
