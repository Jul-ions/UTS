import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class DashboardScreen extends StatelessWidget {
  final String username;

  const DashboardScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.teal[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00BFAE), 
              Color(0xFF1DE9B6), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                'Welcome, $username!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    _buildInfoCard(
                        'Profile', Icons.person, Colors.blueAccent, context),
                    _buildInfoCard(
                        'Settings', Icons.settings, Colors.amber, context),
                    _buildInfoCard('Notifications', Icons.notifications,
                        Colors.orange, context),
                    _buildInfoCard('Help', Icons.help, Colors.red, context),
                    _buildInfoCard(
                        'Messages', Icons.message, Colors.purple, context),
                    _buildInfoCard(
                        'Tasks', Icons.assignment, Colors.greenAccent, context),
                    _buildInfoCard(
                        'Statistics', Icons.bar_chart, Colors.teal, context),
                    _buildInfoCard(
                        'Reports', Icons.pie_chart, Colors.indigo, context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      String title, IconData icon, Color color, BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), 
      ),
      child: InkWell(
        onTap: () {
          _showInfoDialog(context, title);
        },
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 70, 
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(color: Colors.teal)),
          content: Text('You clicked on $title.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
