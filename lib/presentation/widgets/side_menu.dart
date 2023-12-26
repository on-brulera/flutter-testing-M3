import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  
  final GlobalKey<ScaffoldState> scafoldKey;

  const SideMenu({super.key, required this.scafoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    //averiguar notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);    
        widget.scafoldKey.currentState?.closeDrawer();    
      },
      children: [
        Padding(          
          padding: EdgeInsets.fromLTRB(28, hasNotch?10:20, 16, 10),
          child: const Text('data'),
        ),

        ...appMenuItems.map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title)),),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),

        Padding(          
          padding: EdgeInsets.fromLTRB(28, hasNotch?10:20, 16, 10),
          child: const Text('others'),
        ),

        ...appMenuItems.sublist(0,3).map((item) => NavigationDrawerDestination(icon: Icon(item.icon), label: Text(item.title)),),
      ]
    );
  }
}