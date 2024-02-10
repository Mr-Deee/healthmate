import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthmate/Models/Users.dart';
import 'package:healthmate/Screens/postdrug.dart';
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

      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(
            color:Color(0xFF087987),
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



              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 18.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 160,
                      width: 300,
                      child: Card(
                        color: Colors.white10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.2)),
                        shadowColor: Color(0xFF087987),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 25.0),
                                    child: Text(
                                      "Welcome to Healthmate\n",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
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

                                //
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => const postdrug()));
                                    },
                                    child: Admin_selection(
                                      image: 'assets/images/post.jpg',
                                      title: 'Post Drug',
                                      ontap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const postdrug()));
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Admin_selection(
                                    image: 'assets/images/faq.png',
                                    title: '',
                                    ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                          builder: (context) => postdrug()));
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
