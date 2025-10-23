import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/cellphone.dart';
import 'package:couldai_user_app/models/sale.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  // Dummy data for now. In a real app, this would come from a database or state management solution.
  final List<Sale> _sales = [
    Sale(
      cellphone: Cellphone(id: '1', brand: 'Samsung', model: 'Galaxy S23', quantity: 10, price: 799.99),
      quantitySold: 1,
      saleDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Sale(
      cellphone: Cellphone(id: '2', brand: 'Apple', model: 'iPhone 15', quantity: 15, price: 899.99),
      quantitySold: 2,
      saleDate: DateTime.now(),
    ),
  ];

  void _showAddSaleDialog() {
    // In a real app, you'd have a dropdown to select a cellphone from stock.
    // For simplicity, we'll just add a hardcoded sale.
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Record Sale'),
            content: const Text('This is a placeholder to add a new sale. In a real app, you would select a product and quantity.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Logic to add sale would go here
                  Navigator.of(context).pop();
                },
                child: const Text('Record'),
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
      ),
      body: ListView.builder(
        itemCount: _sales.length,
        itemBuilder: (context, index) {
          final sale = _sales[index];
          return ListTile(
            title: Text('${sale.cellphone.brand} ${sale.cellphone.model}'),
            subtitle: Text('Date: ${sale.saleDate.toLocal().toString().split(' ')[0]}'),
            trailing: Text('Sold: ${sale.quantitySold}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSaleDialog,
        tooltip: 'Record Sale',
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
