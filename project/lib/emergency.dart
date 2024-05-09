

import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart';

class Emergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<Loginprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Care'),
        backgroundColor: Color.fromARGB(255, 163, 93, 66),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/logo.png', // Adjust the path to your image
            fit: BoxFit.cover,
          ),
          // Blurred Overlay
          Container(
            color: Colors.black.withOpacity( 0.05), // Adjust opacity as needed
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Your existing widget content here
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    const Text(
                      'Emergency Contact 1:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Name: ${loginProvider.fnamecontroller.text} ${loginProvider.lnamecontroller.text}'),
                        Text('Relationship: ${loginProvider.relationcontroller.text}'),
                        Text('Phone Number: ${loginProvider.phncontroller.text}'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.local_hospital),
                    SizedBox(width: 10),
                    const Text(
                      'Emergency Contact 2:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 30),
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
                    Icon(Icons.local_taxi),
                    SizedBox(width: 10),
                    Text(
                      'Emergency Contact 3:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ambulance: 108'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
