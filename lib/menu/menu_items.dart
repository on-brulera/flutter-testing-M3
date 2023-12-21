import 'package:flutter/material.dart';

class MenuItems{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(title: 'Botones',subTitle: 'Muchos Botones', link: '/buttnos', icon: Icons.smart_button),
  MenuItems(title: 'Tarjetas',subTitle: 'Contenedor estilizado', link: '/cards', icon: Icons.credit_card),
];