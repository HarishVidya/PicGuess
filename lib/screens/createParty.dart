// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:picguess/widgets/utils.dart';
import 'package:vm_service/utils.dart'; 

import 'partyWait.dart';

class CreateParty extends StatefulWidget {
  const CreateParty({super.key});

  @override
  State<CreateParty> createState() => _CreatePartyState();
}

class _CreatePartyState extends State<CreateParty> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _partyNameController = TextEditingController();
  String? _roundsValue;
  String? _partySize;
  
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _partyNameController.dispose();
  }

  void createParty() {
    if (_nameController.text.isNotEmpty &&
        _partyNameController.text.isNotEmpty &&
        _roundsValue != null &&
        _partySize != null) {

          Map<String, String> data = {
            "name": _nameController.text,
            "partyName": _partyNameController.text,
            "rounds": _roundsValue!,
            "size": _partySize!
          };
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => const PartyWait())
          // );


        }

    else {
      Utils.toastMessage("Invalid Size or Number of Rounds");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Create a Party',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _partyNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your party name',
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButton(
            items: <String>['1', '2', '3', '4', '5']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                                                         
                        )
                      )
                    )
                  .toList(),
            hint: Text(
              _roundsValue == null
                ? 'Select Rounds'
                : '$_roundsValue Rounds',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _roundsValue = value!;
              });
            },
          ),
          DropdownButton(
            items: <String>['2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                                                         
                        )
                      )
                    )
                  .toList(),
            hint: Text(
              _partySize == null
                ? 'Select Party Size'
                : '$_partySize People',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _partySize = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 100,
            child: FilledButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PartyWait())
                  );
                },
              child: const Text('Create'),
            ),
          ),
        ],
      ),
    );
  }
}