import 'package:flutter/material.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  final _medications = <Map<String, dynamic>>[];
  final _medicationController = TextEditingController();
  TimeOfDay? _reminderTime;

  void _addMedication() {
    if (_medicationController.text.isNotEmpty && _reminderTime != null) {
      setState(() {
        _medications.add({
          'name': _medicationController.text,
          'time': _reminderTime!.format(context),
          'date': DateTime.now().toString(),
        });
        _medicationController.clear();
        _reminderTime = null;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && mounted) {
      setState(() {
        _reminderTime = picked;
      });
    }
  }

  @override
  void dispose() {
    _medicationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Pharmacy'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue[100]!, Colors.lightBlue[200]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _medicationController,
                      decoration: InputDecoration(
                        labelText: 'Medication Name',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(_reminderTime?.format(context) ?? 'Set Time'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addMedication,
                    child: const Text('Add'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _medications.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text(_medications[index]['name']),
                        subtitle: Text('Time: ${_medications[index]['time']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _medications.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}