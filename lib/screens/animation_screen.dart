import 'package:flutter/material.dart';

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right
      const end = Offset.zero; // End at the center
      const curve = Curves.easeInOut; // Smoother curve

      final tween = Tween<Offset>(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween.chain(CurveTween(curve: curve)));

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500), // Duration of the animation
  );
}