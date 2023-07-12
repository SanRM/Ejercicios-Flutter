import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  Order _order = Order();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Form(
            key: _formStateKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Ingresa un item",
                        labelText: 'Item',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) => _order._validateItemRequired(value!),
                    onSaved: (value) => _order.item = value,
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Ingresa la cantidad",
                        labelText: 'Cantidad',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) => _order._validateItemCount(value!),
                    onSaved: (value) => _order.quantity = int.tryParse(value!),
                    keyboardType: TextInputType.number,
                  ),
                  Divider(height: 32),
                  TextButton(
                    child: Text('Save'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 75, 110)),
                      overlayColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 113, 238, 255)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                    ),
                    onPressed: () => _order._submitOrder(_formStateKey),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class Order {
  String? item;
  int? quantity;

  String? _validateItemRequired(String value) {
    return value.isEmpty ? 'Ingresa por lo menos un item' : null;
  }

  String? _validateItemCount(String value) {
    int? _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);

    return _valueAsInteger == 0 ? 'Ingresa la cantidad de items' : null;
  }

  void _submitOrder(formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('Order item: ${item}');
      print('Order quantity: ${quantity}');
    } else {
      print('Valor no valido ');
    }
  }
}
