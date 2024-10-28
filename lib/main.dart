import 'package:flutter/material.dart';
import 'produits_list.dart'; // Assurez-vous que le fichier produits_list.dart existe

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produits App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProduitsList(), // Votre page principale
    );
  }
}
