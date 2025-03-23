import 'package:flutter/material.dart';


class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
  final _goalsController = TextEditingController();
  final List<Map<String, dynamic>> _progressHistory = [];

  void _addGoal() {
    if (_goalsController.text.isNotEmpty) {
      setState(() {
        _progressHistory.add({
          'goal': _goalsController.text,
          'date': DateTime.now().toString(),
        });
        _goalsController.clear();
      });
    }
  }

  @override
  void dispose() {
    _goalsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Progress Tracking'),
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
              TextField(
                controller: _goalsController,
                decoration: InputDecoration(
                  labelText: 'Set Goal',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addGoal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _progressHistory.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text(_progressHistory[index]['goal']),
                        subtitle: Text(_progressHistory[index]['date']),
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