// import 'package:flutter/material.dart';
// import 'package:project/main.dart';
// import 'package:project/provider/control.dart';
// import 'package:project/second_page.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project/signup.dart';

// class SignInScreen extends StatefulWidget{
//   const SignInScreen({super.key});
//   @override
//   State<SignInScreen> createState() =>_SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen>{
//   bool isLogin=false;

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body:Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF00FF00),
//               Color(0xFF0000FF)
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter
//             ),
//         ),
//         child:SingleChildScrollView(
//           child: Padding(
//             padding:EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 0) ),
//              child:Column(
//             children:<Widget>[
//               logoWidget("assets/images/icon.jpeg"),
//               const SizedBox(
//                 height: 30,
//               ),
//               Consumer<Loginprovider>(
//                 builder: (context, value, child) {

//                   return TextField(controller:value.emailTextController ,
//                     decoration: InputDecoration(
//                     hintText: "Enter email",
//                     prefixIcon:Icon(Icons.person_add_alt_1_outlined)
//                   ),
                    
//                   );
//                   //  reusableTextField(,false);
//                 }
//                 ),
//                 const SizedBox(
//                   height:20,
//                 ),
//                 Consumer<Loginprovider>(
//                   builder:(context,value,child){
//                     return reusableTextField("enter password",Icons.lock_outline,true,value.passwordTextController);
//                   }
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Consumer<Loginprovider>(
//                     builder: (context,value1,child){
//                       return SignInSignUpButton(context,true,(){
//                         isLogin? 
//                         value1.signinUser(value1.emailTextController.text,
//                          value1.passwordTextController.text,context)
//                          :Navigator.push(context,MaterialPageRoute(builder:(context)=>
//                          const SecondPage(),));
//                       });
//                     }
//                     ),
//                     textbutton(),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget textbutton(){
//     return TextButton(
//       onPressed: (){
//         setState((){
//           isLogin=="SIGNUP"?
//           Navigator.push(context,
//           MaterialPageRoute(builder: (context)=> const SignUpScreen()),):
//           isLogin=!isLogin;

//         });
//       }, child: Text(isLogin
//       ? "Don't have an account? SIGNUP"
//       :"Already have an account? LOGIN"));
//   }
// }