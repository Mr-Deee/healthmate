import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/Models/Users.dart';
import 'package:provider/provider.dart';

import '../Models/components/drawer/custom_drawer.dart';
import '../Models/widgets/AdminSelection.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: GlobalAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3.0),
                child: Row(children: [
                  if (Provider.of<Users>(context).userInfo?.firstname !=
                      null)
                    Text(
                      "Hi, " +
                          Provider.of<Users>(context).userInfo!.firstname!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                ]),
              ),
              //
              // Padding(
              //   padding: const EdgeInsets.only(left:108.0, top: 5.0),
              //   child: Row(
              //     children: [
              //       Text("Welcome",
              //
              //         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),
              //       ),
              //     ],
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 18.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 160,
                      width: 300,
                      child: Card(
                        color: Colors.white54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.2)),
                        shadowColor: Colors.tealAccent,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 25.0),
                                  child: Text(
                                    "Welcome to Total House Clinic\n  ",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            // Text("Swipe left\n  ",style: TextStyle( fontSize: 10,fontWeight: FontWeight.bold, color: Colors.blue)
                            //),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(0),
                  ),
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: GestureDetector(
                                //     onTap: () {
                                //       Navigator.of(context).push(
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   askaquestion()));
                                //     },
                                //     child: Admin_selection(
                                //       image: 'assets/images/consultancy.png',
                                //       title: 'Ask a Question',
                                //     ),
                                //   ),
                                // ),

                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: GestureDetector(
                                //     onTap: () {
                                //       Navigator.of(context).push(
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   DoctorProfilePage()));
                                //     },
                                //     child: Admin_selection(
                                //       image: 'assets/images/lookup.png',
                                //       title: 'Doctor Lookup',
                                //       ontap: () {
                                //         //  initiatePhoneCall('tel:$_phone');
                                //       },
                                //     ),
                                //   ),
                                // ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Admin_selection(
                                    image: 'assets/images/faq.png',
                                    title: 'FAQs',
                                    ontap: () {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => polls()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // sectionTitle(context, "Departments"),
                    Container(
                      color: const Color(0xFFFFFFFF),
                      height: 200,

                      child: ListView(
                        padding: EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => Dentist()));
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Container(
                          //       width: 180,
                          //       child: Row(
                          //         children: [
                          //           Image.asset("assets/images/tooth.png",
                          //               height: 120),
                          //           Center(
                          //               child: Text(
                          //                 "Dentist",
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 16),
                          //               )),
                          //         ],
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: Color(0xFFB3CA2E6),
                          //         borderRadius: BorderRadius.only(
                          //             topRight: Radius.circular(25),
                          //             topLeft: Radius.circular(25),
                          //             bottomLeft: Radius.circular(25),
                          //             bottomRight: Radius.circular(25)),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.5),
                          //             spreadRadius: 5,
                          //             blurRadius: 7,
                          //             offset: Offset(
                          //                 0, 3), // changes position of shadow
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       Navigator.of(context).push(MaterialPageRoute(
                          //           builder: (context) => pharmacy()));
                          //     },
                          //     child: Container(
                          //       width: 180,
                          //       child: Row(
                          //         children: [
                          //           Image.asset("assets/images/pill.png",
                          //               height: 60),
                          //           Center(
                          //               child: Text(
                          //                 "Pharmacy",
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold,
                          //                     fontSize: 16),
                          //               )),
                          //         ],
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: Color(0xFFB3CA2E6),
                          //         borderRadius: BorderRadius.only(
                          //             topRight: Radius.circular(25),
                          //             topLeft: Radius.circular(25),
                          //             bottomLeft: Radius.circular(25),
                          //             bottomRight: Radius.circular(25)),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.black26,
                          //             spreadRadius: 5,
                          //             blurRadius: 7,
                          //             offset: Offset(
                          //                 0, 3), // changes position of shadow
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       Navigator.of(context).push(MaterialPageRoute(
                          //           builder: (context) => Gynecology()));
                          //     },
                          //     child: Container(
                          //       width: 180,
                          //
                          //       child: Center(
                          //           child: SingleChildScrollView(
                          //             scrollDirection: Axis.horizontal,
                          //             child: Row(
                          //               children: [
                          //                 Image.asset("assets/images/gyn.png",
                          //                     height: 80),
                          //                 Text(
                          //                   "Gynecology",
                          //                   style: TextStyle(
                          //                       color: Colors.white,
                          //                       fontWeight: FontWeight.bold,
                          //                       fontSize: 16),
                          //                 ),
                          //               ],
                          //             ),
                          //           )),
                          //       // color: Colors.white38,
                          //       decoration: BoxDecoration(
                          //         color: Color(0xFFB3CA2E6),
                          //         borderRadius: BorderRadius.only(
                          //             topRight: Radius.circular(25),
                          //             topLeft: Radius.circular(25),
                          //             bottomLeft: Radius.circular(25),
                          //             bottomRight: Radius.circular(25)),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.5),
                          //             spreadRadius: 5,
                          //             blurRadius: 7,
                          //             offset: Offset(
                          //                 0, 3), // changes position of shadow
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
