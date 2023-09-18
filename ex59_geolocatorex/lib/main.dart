import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX59'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _apiKey = 'AIzaSyADB-IX2iqj-Uas34NmyoLKI252eqjBzK4';
  late LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
  late Position _currentPosition;
  String _currentAddress = '';
  String lat = '';
  String lon = '';

  _getCurrentLocation() async {
    await Permission.location.request().then((status) {
      if (status == PermissionStatus.granted) {
        Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best,
                forceAndroidLocationManager: false)
            .then((Position position) {
          _currentPosition = position;
          setState(() {
            lat = '${position.latitude}';
            lon = '${position.longitude}';
          });
        }).catchError((e) {
          print(e);
        });
      } else {
        print('위치서비스 사용할 수 없다.');
      }
    });
  }

Future<void> _getAddressFromLatLng() async {
  final addresses = await geocoder.findAddressesFromCoordinates(
    Coordinates(_currentPosition.latitude, _currentPosition.longitude),
  );
    

  if (addresses.isNotEmpty) {
    final message = addresses.first.addressLine;
    if (message != null) {
      setState(() {
        _currentAddress = message;
      });
    } else {
      print('주소를 찾을 수 없습니다.');
    }
  } else {
    print('주소를 찾을 수 없습니다.');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$lat $lon"),
            Text(_currentAddress),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text('현재 위치 찾기', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: const Text('현재 주소 구하기', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _getAddressFromLatLng();
              },
            )
          ],
        ),
      ),
    );
  }
}
