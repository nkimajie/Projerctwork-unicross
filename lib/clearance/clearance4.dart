import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mywork/clearance/clearance5.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Clearance4 extends StatefulWidget {
  @override
  _Clearance4State createState() => _Clearance4State();
}

class _Clearance4State extends State<Clearance4> {
  Set<Marker> _makers = {};
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0988CC),
        title: Center(
          child: Text(
            'Stage 4',
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
          width: screenWidth,
          height: screenHeight,
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
                      'Store Clearance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin',
                        color: Color(0xFF0988CC),
                      ),
                    ),
                    subtitle: Text(
                      'Take your fee clearance card and Matriculation gown receipt to the store ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cabin',
                        color: Color(0xff424242),
                      ),
                    ),
                    trailing: TextButton(
                      // color: Color(0xFF0988CC),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF0988CC)),
                      ),
                      onPressed: () async {
                        final prefs2 = await SharedPreferences.getInstance();
                        prefs2.setInt('counter2', 4);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Clearance5()));
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
              Container(
                width: screenWidth,
                height: screenHeight * 0.73,
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _makers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(4.927873, 8.330530),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      _makers.add(Marker(
                          markerId: MarkerId('clearance4'),
                          position: LatLng(4.928421, 8.330083),
                          infoWindow: InfoWindow(
                            title: 'CRUTECH Store',
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
