import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  const Gratitude({super.key, required this.radioGroupValue});

  final int radioGroupValue;

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = [];
  String? _selectedGratitude;
  int? _radioGroupValue;

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList.add('Family');
    _gratitudeList.add('Friends');
    _gratitudeList.add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: [
          IconButton(
              onPressed: () => _selectedGratitude != null ? Navigator.pop(context, _selectedGratitude) : Navigator.pop(context, null),
              icon: Icon(Icons.check))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Radio(
                  value: 0,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index!)),
              Text('Family'),
              Radio(
                  value: 1,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index!)),
              Text('Friends'),
              Radio(
                  value: 2,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index!)),
              Text('Coffee')
            ],
          ),
        ),
      ),
    );
  }
}
