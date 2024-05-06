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
        title: const Text('Emergency Care'),
        backgroundColor: Color.fromARGB(255, 163, 93, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person), // Icon on the left
                SizedBox(width: 10),
                const Text(
                  'Emergency Contact 1:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30), // Padding to align with the icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${loginProvider.fnamecontroller.text} ${loginProvider.lnamecontroller.text}'),
                    Text('Relationship: ${loginProvider.relationcontroller.text}'),
                    Text('Phone Number: ${loginProvider.phncontroller.text}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.local_hospital), // Icon on the left
                SizedBox(width: 10),
                const Text(
                  'Emergency Contact 2:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30), // Padding to align with the icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hospital: ${loginProvider.hsptlcontroller.text}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.local_taxi), // Icon on the left
                SizedBox(width: 10),
                Text(
                  'Emergency Contact 3:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30), // Padding to align with the icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ambulance:108'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart'; 
import 'package:geolocator/geolocator.dart'; // Import Geolocator package

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  List<String> hospitals = []; // List to store nearby hospitals

  @override
  void initState() {
    super.initState();
    // Call method to fetch nearby hospitals when the widget initializes
    getNearbyHospitals();
  }

  Future<void> getNearbyHospitals() async {
    try {
      // Fetch current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Fetch nearby places (hospitals in this case) using a location service or API
      // Replace the below logic with your actual implementation to fetch nearby hospitals
      List<String> nearbyHospitals = await fetchNearbyHospitals(position.latitude, position.longitude);

      setState(() {
        hospitals = nearbyHospitals;
      });
    } catch (e) {
      print("Error getting nearby hospitals: $e");
    }
  }

  // Method to fetch nearby hospitals (Replace with your actual implementation)
  Future<List<String>> fetchNearbyHospitals(double latitude, double longitude) async {
    // You can implement fetching nearby hospitals using any suitable API or service here
    // For example, you can use Google Places API or any other service
    // This is just a placeholder method
    return ["Hospital A", "Hospital B", "Hospital C"];
  }

  @override
  Widget build(BuildContext context) {
    // Access the instance of your provider class
    final loginProvider = Provider.of<Loginprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Care'),
        backgroundColor: Color.fromARGB(255, 163, 93, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person), // Icon on the left
                SizedBox(width: 10),
                const Text(
                  'Emergency Contact 1:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30), // Padding to align with the icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${loginProvider.fnamecontroller.text} ${loginProvider.lnamecontroller.text}'),
                    Text('Relationship: ${loginProvider.relationcontroller.text}'),
                    Text('Phone Number: ${loginProvider.phncontroller.text}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.local_hospital), // Icon on the left
                SizedBox(width: 10),
                const Text(
                  'Emergency Contact 2:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30), // Padding to align with the icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hospital: ${loginProvider.hsptlcontroller.text}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.local_taxi), // Icon on the left
                SizedBox(width: 10),
                Text(
                  'Emergency Contact 3:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30), // Padding to align with the icon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ambulance:108'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Display nearby hospitals
            Text(
              'Nearby Hospitals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(hospitals[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/