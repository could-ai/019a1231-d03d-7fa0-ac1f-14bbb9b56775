import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/cellphone.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final List<Cellphone> _cellphones = [
    Cellphone(id: '1', brand: 'Samsung', model: 'Galaxy S23', quantity: 10, price: 799.99),
    Cellphone(id: '2', brand: 'Apple', model: 'iPhone 15', quantity: 15, price: 899.99),
    Cellphone(id: '3', brand: 'Google', model: 'Pixel 8', quantity: 8, price: 699.99),
  ];

  void _addCellphone(Cellphone cellphone) {
    setState(() {
      _cellphones.add(cellphone);
    });
  }

  void _showAddStockDialog() {
    final brandController = TextEditingController();
    final modelController = TextEditingController();
    final quantityController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Stock'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: brandController, decoration: const InputDecoration(labelText: 'Brand')),
                TextField(controller: modelController, decoration: const InputDecoration(labelText: 'Model')),
                TextField(controller: quantityController, decoration: const InputDecoration(labelText: 'Quantity'), keyboardType: TextInputType.number),
                TextField(controller: priceController, decoration: const InputDecoration(labelText: 'Price'), keyboardType: const TextInputType.numberWithOptions(decimal: true)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final brand = brandController.text;
                final model = modelController.text;
                final quantity = int.tryParse(quantityController.text) ?? 0;
                final price = double.tryParse(priceController.text) ?? 0.0;

                if (brand.isNotEmpty && model.isNotEmpty && quantity > 0 && price > 0) {
                  final newCellphone = Cellphone(
                    id: DateTime.now().toString(),
                    brand: brand,
                    model: model,
                    quantity: quantity,
                    price: price,
                  );
                  _addCellphone(newCellphone);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Management'),
      ),
      body: ListView.builder(
        itemCount: _cellphones.length,
        itemBuilder: (context, index) {
          final cellphone = _cellphones[index];
          return ListTile(
            title: Text('${cellphone.brand} ${cellphone.model}'),
            subtitle: Text('Price: \$${cellphone.price.toStringAsFixed(2)}'),
            trailing: Text('Qty: ${cellphone.quantity}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStockDialog,
        tooltip: 'Add Stock',
        child: const Icon(Icons.add),
      ),
    );
  }
}
