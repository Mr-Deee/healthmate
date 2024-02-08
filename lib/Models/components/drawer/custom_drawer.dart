

import 'package:flutter/material.dart';
import 'package:totalclinic/Pages/DoctorProfile.dart';

import 'package:totalclinic/Pages/home.dart';

import '../../Pages/OfficeLocations.dart';
import 'bottom_user_info.dart';
import 'custom_list_tile.dart';
import 'header.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),

        width: _isCollapsed ? 230 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          //color: Color.fromRGBO(20, 20, 20, 1),
          color: Colors.blueAccent
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.white,
              ),
             CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.home_outlined,
                  title: 'Home',
                  infoCount: 0,
               ontap: () {   Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) =>  HomeScreen ())); },
                ),
              //
              // CustomListTile(
              //   isCollapsed: _isCollapsed,
              //   icon: Icons.calendar_today,
              //   title: 'Calender',
              //   infoCount: 0, ontap: () {  },
              // ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.pin_drop,
                title: 'Office Locations',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,

                ontap: () {  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  officelocation ()));},
              ),
              // CustomListTile(
              //   isCollapsed: _isCollapsed,
              //   icon: Icons.message_rounded,
              //   title: 'Messages',
              //   infoCount: 8, ontap: () {
              //   Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>  HomeScreen ()));
              // }
              // ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.healing,
                title: 'Doctors',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                ontap: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        DoctorProfilePage()));  },
              ),

              const Divider(color: Colors.grey),
              const Spacer(),
              // CustomListTile(
              //   isCollapsed: _isCollapsed,
              //   icon: Icons.notifications,
              //   title: 'Notifications',
              //   infoCount: 2, ontap: () {  },
              // ),

              const SizedBox(height: 20),
              BottomUserInfo(isCollapsed: _isCollapsed),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
