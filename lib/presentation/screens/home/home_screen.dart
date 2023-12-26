import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget{

  static const String name = 'home_screen';
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final scafoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scafoldKey: scafoldKey)
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {        
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];
        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  
  final MenuItems item;
  const _CustomListTile({required this.item,});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(item.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      onTap: (){
        context.push(item.link);
      },
    );
  }
}