import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController nomController;
  final VoidCallback? onAdd;
  final VoidCallback? onCancel;

  const AddProduit({
    super.key,
    required this.nomController,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ajouter un produit"),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: "Nom du produit",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onAdd,
                  child: const Text('Add'),
                ),
                MaterialButton(
                  onPressed: onCancel,
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
