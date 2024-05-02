
import 'package:flutter/material.dart';
import 'package:project/second_page.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/op.jpg',
            // fit: BoxFit.cover,
            height: double.infinity,
          ),

          
          Container(
            color: Colors.black.withOpacity(0.3), 
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
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
                          decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),)
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Email',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      
                     
                      
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Age',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Gender',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                       Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Medical condition',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Doctor Preferred',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                          
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Address',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text('EMERGENCY CONTACT DETAILS',
                  style: TextStyle(color:Colors.white,
                  fontSize: 20.0,fontFamily: 'Poppins',),),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                          
                        ),
                      ),
                     
                    ],
                  ),
                  Row(
                    children: [
                     Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Relationship',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Phone Number',hintStyle: TextStyle(color:Colors.white,fontFamily: 'Poppins',),),
                          
                        ),
                      ),],
                  ),
                   
                ],
               
              ),
            ),
          ),
        ],
      ),
    );
  }
}