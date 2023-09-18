import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

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
      home: const MyHomePage(title: 'EX60'),
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
  Completer<GoogleMapController> _controller = Completer();
  LatLng _myLoc1 = LatLng(37.5372, 126.9426); //마포대교
  LatLng _myLoc2 = LatLng(37.5334, 126.9394); //한강
  List<Marker> _markers = [];
  void setMarkerData() {
    /*
      마커 클릭시 인포 윈도우를 띄울 수 있다.
      제목과 간단한 설명 출력가능
    */
    final marker1 = Marker(
      markerId: MarkerId('A01'),
      position: _myLoc1,
      infoWindow: InfoWindow(
          title: "마포대교",
          snippet: "마포대교는 무너졌냐?",
          onTap: () {
            print('aaaa');
          }),
    );
    _markers.add(marker1);
    final marker2 = Marker(
      markerId: MarkerId('A02'),
      position: _myLoc2,
      infoWindow: InfoWindow(
          title: "한강",
          snippet: "차가워?",
          onTap: () {
            print('bbbb');
          }),
    );
    _markers.add(marker2);
  }

  @override
  void initState() {
    super.initState();
    setMarkerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _myLoc1,
                zoom: 15.0,
              ),
              markers: Set.from(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('마포대교 이동', style: TextStyle(fontSize: 24)),
                onPressed: () => goToLocation(_myLoc1),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                child: const Text('한강 다이빙', style: TextStyle(fontSize: 24)),
                onPressed: () => goToLocation(_myLoc2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 이동버튼 클릭시 카메라의 위치 및 이동박식, 표현방식 설정
  Future<void> goToLocation(LatLng loc) async {
    final GoogleMapController controller = await _controller.future;
    final CameraPosition pos = CameraPosition(
      target: loc,
      zoom: 15,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }
}
