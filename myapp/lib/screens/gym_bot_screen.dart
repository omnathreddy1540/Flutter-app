import 'package:flutter/material.dart';

class GymDietScreen extends StatefulWidget {
  const GymDietScreen({super.key});

  @override
  State<GymDietScreen> createState() => _GymDietScreenState();
}

class _GymDietScreenState extends State<GymDietScreen> {
  final _meals = <Map<String, dynamic>>[];
  final _workouts = <Map<String, dynamic>>[];
  final _mealController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _workoutController = TextEditingController();

  void _addMeal() {
    if (_mealController.text.isNotEmpty && _caloriesController.text.isNotEmpty) {
      setState(() {
        _meals.add({
          'meal': _mealController.text,
          'calories': int.parse(_caloriesController.text),
          'date': DateTime.now().toString(),
        });
        _mealController.clear();
        _caloriesController.clear();
      });
    }
  }

  void _addWorkout() {
    if (_workoutController.text.isNotEmpty) {
      setState(() {
        _workouts.add({
          'workout': _workoutController.text,
          'date': DateTime.now().toString(),
        });
        _workoutController.clear();
      });
    }
  }

  @override
  void dispose() {
    _mealController.dispose();
    _caloriesController.dispose();
    _workoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Gym & Diet'),
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
              const Text(
                'Log Meal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _mealController,
                      decoration: InputDecoration(
                        labelText: 'Meal',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _caloriesController,
                      decoration: InputDecoration(
                        labelText: 'Calories',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addMeal,
                    child: const Text('Add Meal'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Log Workout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextField(
                controller: _workoutController,
                decoration: InputDecoration(
                  labelText: 'Workout',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addWorkout,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Meals',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _meals.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              title: Text(_meals[index]['meal']),
                              subtitle: Text('${_meals[index]['calories']} kcal'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _meals.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Workouts',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _workouts.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              title: Text(_workouts[index]['workout']),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _workouts.removeAt(index);
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
            ],
          ),
        ),
      ),
    );
  }
}