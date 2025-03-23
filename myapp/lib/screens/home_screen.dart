import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'settings') {
                Navigator.pushNamed(context, '/settings');
              } else if (value == 'logout') {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'settings', child: Text('Settings')),
              const PopupMenuItem(value: 'logout', child: Text('Logout')),
            ],
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue[100]!, Colors.lightBlue[200]!],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
                padding: const EdgeInsets.all(16),
                children: [
                  _buildContainer('Progress Tracking', Icons.trending_up, () {
                    Navigator.pushNamed(context, '/progress');
                  }),
                  _buildContainer('Pharmacy', Icons.local_pharmacy, () {
                    Navigator.pushNamed(context, '/pharmacy');
                  }),
                  _buildContainer('Gym/Diet', Icons.fitness_center, () {
                    Navigator.pushNamed(context, '/gym_diet');
                  }),
                  _buildContainer('Chatbot', Icons.chat, () {
                    Navigator.pushNamed(context, '/chat');
                  }),
                  _buildContainer('Profile', Icons.person, () {
                    Navigator.pushNamed(context, '/profile');
                  }),
                  _buildContainer('Settings', Icons.settings, () {
                    Navigator.pushNamed(context, '/settings');
                  }),
                  _buildContainer('Notifications', Icons.notifications, () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Notifications clicked')),
                    );
                  }),
                  _buildContainer('Help', Icons.help, () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Help clicked')),
                    );
                  }),
                ],
              ),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blue, size: 24),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.blue),
            onPressed: () => Navigator.pushNamed(context, '/home'),
            tooltip: 'Home',
          ),
          IconButton(
            icon: const Icon(Icons.trending_up, color: Colors.grey),
            onPressed: () => Navigator.pushNamed(context, '/progress'),
            tooltip: 'Progress',
          ),
          IconButton(
            icon: const Icon(Icons.local_pharmacy, color: Colors.grey),
            onPressed: () => Navigator.pushNamed(context, '/pharmacy'),
            tooltip: 'Pharmacy',
          ),
          IconButton(
            icon: const Icon(Icons.fitness_center, color: Colors.grey),
            onPressed: () => Navigator.pushNamed(context, '/gym_diet'),
            tooltip: 'Gym/Diet',
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.grey),
            onPressed: () => Navigator.pushNamed(context, '/chat'),
            tooltip: 'Chat',
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.grey),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            tooltip: 'Profile',
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.grey),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            tooltip: 'Settings',
          ),
          IconButton(
            icon: const Icon(Icons.help, color: Colors.grey),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help clicked')),
              );
            },
            tooltip: 'Help',
          ),
        ],
      ),
    );
  }
}