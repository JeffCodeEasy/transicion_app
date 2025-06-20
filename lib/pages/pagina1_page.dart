import 'package:flutter/material.dart';
import 'package:transicion_app/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: const Center(
        child: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _crearRuta());
        },
        child: const Icon(Icons.access_time),
      ),
    );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
      pageBuilder: (
        context,
        animation,
        secondaryAnimation,
      ) =>
          const Pagina2Page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        // return SlideTransition(
        //   position: Tween(begin: const Offset(0.5, 1.0), end: Offset.zero)
        //       .animate(curvedAnimation),
        //   child: child,
        // );

        return ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child);
      },
      // transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
