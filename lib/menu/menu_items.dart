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
  MenuItems(title: 'Botones',subTitle: 'Muchos Botones', link: '/buttons', icon: Icons.smart_button),
  MenuItems(title: 'Tarjetas',subTitle: 'Contenedor estilizado', link: '/cards', icon: Icons.credit_card),
  MenuItems(title: 'Progress Indicator',subTitle: 'Generales y controlador', link: '/progress', icon: Icons.refresh_rounded),
  MenuItems(title: 'Snackbar y dialogs',subTitle: 'Indicadores en pantalla', link: '/snackbar', icon: Icons.info_outline),
  MenuItems(title: 'Animated Contained',subTitle: 'Cuadro animado', link: '/animated', icon: Icons.check_box_outlined),
  MenuItems(title: 'UI Controls + Tiles',subTitle: 'Serie de controles', link: '/ui-controls', icon: Icons.card_membership_outlined),
  MenuItems(title: 'Introducción a la App',subTitle: 'Pequeño tutorial App', link: '/tutorial', icon: Icons.accessibility_new_rounded),
];