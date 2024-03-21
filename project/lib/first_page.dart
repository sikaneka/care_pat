import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Create Your Care Profile'),
      // ),
      backgroundColor: Colors.blue[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.0),
            //     color:Colors.white,
            //   ),
            //   child: SizedBox(
            //     width:300,
            //     height: 300,
            //     child: Image.asset('assets/images/img_rectangle_1.png',
            //     fit:BoxFit.cover),
            //   ),

            //   Container(
            //     width:300,
            //     height:100,
                
                
            //   ),
            // ),

            
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              width: 300,
              height: 300,
              child: Image.asset('assets/images/img_rectangle_1.png',
              fit: BoxFit.cover,), 
              // Replace with your image path
            ),
            // const SizedBox(height: 20),

            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
             
              child: const SizedBox(
                width: 300,
                height:50,
                child: Center(
                child:Text(
                  'Create your Care profile',
                  style: TextStyle(fontSize: 20.0),
                )
                ),
              ),
            ),
           
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()));
              },
              child: const Text('Lets get started....'),
            ),
          ],
        ),
      ),
    );
  }
}
