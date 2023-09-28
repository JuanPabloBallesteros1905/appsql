import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class BottonNavigation extends StatelessWidget {
  const BottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UiProvider>(context);

    // ignore: prefer_const_declarations
    final currentIndex = provider.selected;

    return BottomNavigationBar(
        onTap: (value) {
          provider.selected = value;
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.directions), label: 'Direcciones')
        ]);
  }
}
