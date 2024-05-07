
import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:project/second_page.dart';
import 'package:provider/provider.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Color.fromARGB(255, 135, 136, 150),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/op.jpg',
            // fit: BoxFit.cover,
            height: double.infinity,
          ),

          
          Container(
            color: Colors.black.withOpacity(0.3), 
            child:  Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<Loginprovider>(
                builder: (context,value,child) {
                  return Column(
                    children: [
                      Text('PERSONAL DETAILS',
                      style: TextStyle(color:Colors.white,
                      fontSize: 20.0,fontFamily: 'Poppins',),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          
                          Expanded(
                            child: TextField(
                              controller: value.namecontroller,
                              decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),)
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(
                              controller: value.lastcontroller,
                              decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(controller: value.addcontroller,
                              decoration: InputDecoration(hintText: 'Address',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(controller: value.phonenumbercontroller,
                              decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          
                         
                          
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(controller: value.agecontroller,
                              decoration: InputDecoration(hintText: 'Age',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(controller: value.gendercontroller,
                              decoration: InputDecoration(hintText: 'Gender',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                           Expanded(
                            child: TextField(controller: value.medcondcontroller,
                              decoration: InputDecoration(hintText: 'Medical condition',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(controller: value.doctorcontroller,
                              decoration: InputDecoration(hintText: 'Doctor Preferred',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                              
                            ),
                          ),
                        ],
                      ),
              
                      SizedBox(height: 10.0),
                      Text('EMERGENCY CONTACT DETAILS',
                      style: TextStyle(color:Colors.white,
                      fontSize: 20.0,fontFamily: 'Poppins',),),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: value.fnamecontroller, 
                              decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(controller: value.lnamecontroller,
                              decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                              
                            ),
                          ),
                         
                        ],
                      ),
                      Row(
                        children: [
                         Expanded(
                            child: TextField(controller: value.relationcontroller,
                              decoration: InputDecoration(hintText: 'Relationship',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextField(controller: value.phncontroller,
                              decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                              
                            ),
                          ),],
                      ),
                       Row(
                        children: [
                         Expanded(
                            child: TextField(controller: value.hsptlcontroller,
                              decoration: InputDecoration(hintText: 'Hospital contact',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          ],
                      ),
                    ],
                   
                  );
                }
              ),
            ),
          ),Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Consumer<Loginprovider>(
                builder: (context,value,child) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        value.addregistration(context);
                        // Handle register button tap
                      },
                      child: Text('Register'),
                    ),
                  );
                }
              ),
            ),
        ],
      ),
    );
  }
} 