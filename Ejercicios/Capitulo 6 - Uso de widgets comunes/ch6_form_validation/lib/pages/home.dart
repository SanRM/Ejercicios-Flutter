// ignore_for_file: unused_field

import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  String? _name;
  String? _mobile;
  String? _email;

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      setState(() {
        _autoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidate,
                child: formUI(),
              ),
            ),
          ),
        ),
      );
  }


  formUI(){
    
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Nombre'),
          keyboardType: TextInputType.name,
          validator: validateName,
          onSaved: (String? val) {
            _name = val;
          },
        ),
         TextFormField(
          decoration: const InputDecoration(labelText: 'Número de teléfono'),
          keyboardType: TextInputType.phone,
          validator: validateName,
          onSaved: (String? val) {
            _mobile = val;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateName,
          onSaved: (String? val) {
            _mobile = val;
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        OutlinedButton(
          onPressed: _validateInputs, 
          child: const Text('Validar')
        ),
      ],
    );
  }

  String? validateName(String? value) {
      if (value!.isEmpty) {
        return 'Name cannot be empty';
      }
      if (value.length < 3) {
        return 'Name must be more than 2 charater';
      } else {
        return null;
      }
    }

  String? validateMobile(String? value) {
      if (value!.isEmpty) {
        return 'Phone number cannot be empty';
      }
      if (value.length != 10) {
        return 'Mobile Number must be of 10 digit';
      } else {
        return null;
      }
    }

    String? validateEmail(String? value) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      if (value!.isEmpty) {
        return 'Email cannot be empty';
      }
      if (!regex.hasMatch(value)) {
        return 'Enter Valid Email';
      } else {
        return null;
      }
    }

}