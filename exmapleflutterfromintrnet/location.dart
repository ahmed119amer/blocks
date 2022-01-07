import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Location Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PermissionStatus _permissionGranted;

  String loca = '';

  double? lat;

  double? long;
   String? livelocati;

  late String livelocation='';

/// chack gps and location 
  Future<void> chack() async {
    late bool servisenabled;
    Location location = Location();
    servisenabled = await location.serviceEnabled();
    LocationData locationda;
    if (servisenabled) {
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        locationda = await location.getLocation();
        /// live location listen
        /*
        location.onLocationChanged.listen((LocationData currentLocation) {
          
          setState(() {
            livelocation='${currentLocation.latitude} :: ${currentLocation.longitude}';
          });print(livelocation);
        });
        */
        setState(() {
          lat = locationda.latitude;
          long = locationda.longitude;
          loca = '${lat!} ::: ${long!}';
        });
        print(loca);
        print('start tracking');
      } else {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          locationda = await location.getLocation();
          setState(() {
            // loca = '${locationda.latitude!} ::: ${locationda.longitude!}';
          });

          print('${locationda.latitude!} ::: ${locationda.longitude!}');
        } else {
          SystemNavigator.pop();
        }
      }
      print('Gps Enable');
    } else {
      servisenabled = await location.requestService();
      if (_permissionGranted == PermissionStatus.granted) {
        locationda = await location.getLocation();
        print('${locationda.latitude!} ::: ${locationda.longitude!}');
        print('start tracking');
      } else {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          locationda = await location.getLocation();
          print('${locationda.latitude!} ::: ${locationda.longitude!}');
        } else {
          SystemNavigator.pop();
        }
      }
      if (servisenabled) {
        print('ok Gps pirrmision enable');
      } else {
        SystemNavigator.pop();
      }
    }
  }


  @override
  void initState() {
    chack();
    // o();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('start!!!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(32),

            child:lat==null
            ? const Text('')
            : Text(
              calculateDistance(lat, long, 30.542540, 47.759000)
                  .toStringAsFixed(3),
              // '$livelocation',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 1000 * 12742 * asin(sqrt(a));
}
