import 'package:flutter/material.dart';

class MyNicePage extends StatefulWidget {
  @override
  _MyNicePageState createState() => _MyNicePageState();
}

class _MyNicePageState extends State<MyNicePage> {
  late String selectedOption1;
  late String selectedOption2;
  late String selectedOption3;
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Nice Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedOption1,
              onChanged:(value) {
                
              },
              items: ['Option 1', 'Option 2', 'Option 3']
                  .map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOption2,
              onChanged: (value) {
                
              },
              items: ['Choice A', 'Choice B', 'Choice C']
                  .map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOption3,
              onChanged: (value) {
                
              },
              items: ['Item 1', 'Item 2', 'Item 3']
                  .map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: textFieldController1,
              decoration: InputDecoration(
                labelText: 'Text Field 1',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: textFieldController2,
              decoration: InputDecoration(
                labelText: 'Text Field 2',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the button click here
                // For example, you can access the selected options and text field values
                print('Selected Option 1: $selectedOption1');
                print('Selected Option 2: $selectedOption2');
                print('Selected Option 3: $selectedOption3');
                print('Text Field 1 Value: ${textFieldController1.text}');
                print('Text Field 2 Value: ${textFieldController2.text}');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyNicePage(),
  ));
}
