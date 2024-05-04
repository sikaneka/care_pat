import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart'; 

class Emergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the instance of your provider class
    final loginProvider = Provider.of<Loginprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Emergency Contact 1:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            //Text('First Name: ${loginProvider.fnamecontroller.text}'),
            //Text('Last Name: ${loginProvider.lnamecontroller.text}'),
            
            Text('Name: ${loginProvider.fnamecontroller.text} + ${loginProvider.lnamecontroller.text}'),
            Text('Relationship: ${loginProvider.relationcontroller.text}'),
            Text('Phone Number: ${loginProvider.phncontroller.text}'),
            SizedBox(height: 20),
           

           
            
          ],
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';


class Emergency extends StatelessWidget {
  Emergency();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Hospitals Finder')
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController mapController;
  LatLng currentLocation;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      mapController.animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 15));
    });
    findHospitals();
  }

  void findHospitals() async {
    final places = GoogleMapsPlaces(apiKey: 'YOUR_API_KEY');

    PlacesSearchResponse response = await places.searchNearbyWithRadius(
        Location(currentLocation.latitude, currentLocation.longitude), 100,
        type: 'hospital');

    setState(() {
      markers.clear();
      if (response.results.isNotEmpty) {
        response.results.forEach((place) {
          markers.add(
            Marker(
              markerId: MarkerId(place.placeId),
              position: LatLng(place.geometry.location.lat, place.geometry.location.lng),
              infoWindow: InfoWindow(title: place.name),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals Finder'),
      ),
      body: currentLocation == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 15.0,
              ),
              markers: Set<Marker>.of(markers),
            ),
    );
  }
}*/
