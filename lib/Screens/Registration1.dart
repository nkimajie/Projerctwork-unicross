import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mywork/Screens/Registration2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration1 extends StatefulWidget {
  @override
  _Registration1State createState() => _Registration1State();
}

class _Registration1State extends State<Registration1> {
  Set<Polyline> _polylines = Set<Polyline>();

  Location location = new Location();
  List<LatLng> polylinesCoordinate = [];
  PolylinePoints polylinePoints;
  Set<Marker> _makers = {};
  bool _serviceEnabled;
  LocationData _currentPosition;
  PermissionStatus _permissionGranted;

  @override
  void initState() {
    super.initState();
    // getUserLocation();
    polylinePoints = PolylinePoints();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0988CC),
        title: Center(
          child: Text(
            'Stage 1',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Cabin',
              color: Color(0xffE0F7FA),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // width: screenWidth,
          // height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Color(0xffF5F5F5),
                  child: ListTile(
                    title: Text(
                      'Pay Acceptance fee',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Color(0xFF0988CC),
                      ),
                    ),
                    subtitle: Text(
                      'You have to pay your acceptance fee at CRUTECH Micro finance bank or heritage bank',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        // color: Color(0xFF0988CC),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF0988CC)),
                        ),
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setInt('counter', 1);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration2()));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cabin',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.72,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _makers,
                  polylines: _polylines,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(4.927873, 8.330530),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      _makers.add(
                        Marker(
                            markerId: MarkerId('stage1'),
                            position: LatLng(4.931485, 8.329666),
                            infoWindow: InfoWindow(
                              title: 'MicroFinance',
                            )),
                      );
                      _makers.add(Marker(
                          markerId: MarkerId('id-1'),
                          position: LatLng(4.927873, 8.330530),
                          infoWindow: InfoWindow(
                            title: 'Heritage Bank',
                          )));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
