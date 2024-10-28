import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<List<dynamic>> liste = [
    ["1 Produit", false],
    ["2 Produit", false],
    ["3 Produit", false],
    ["4 Produit", false],
    ["5 Produit", false],
  ];

  final TextEditingController nomController = TextEditingController();

  void onChanged(bool? value, int index) {
    setState(() {
      liste[index][1] = value;
    });
  }

  void saveProduit() {
    setState(() {
      liste.add([nomController.text, false]);
      nomController.clear();
      Navigator.of(context).pop(); // Ferme le dialogue après ajout
    });
  }

  void addProduit() {
    showDialog(
      context: context,
      builder: (context) {
        return AddProduit(
          nomController: nomController,
          onAdd: saveProduit,
          onCancel: () {
            Navigator.of(context).pop(); // Ferme le dialogue sans ajout
          },
        );
      },
    );
  }

  void delProduit(int index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits"),
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: liste[index][0],
            selProduit: liste[index][1],
            onChanged: (value) => onChanged(value, index),
            delProduit: (context) => delProduit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduit,
        child: const Icon(Icons.add),
      ),
    );
  }
}
