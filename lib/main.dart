import 'package:guia/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'pages/notification_page.dart';
import 'pages/home_page.dart';
import 'pages/info_page.dart';
import 'pages/new_page.dart';
import 'pages/agenda_page.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peruaçu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primarySwatch: Colors.brown,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const InfoPage(),
    const NewPage(),
    const AgendaPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index < _screens.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onNotificationPressed() {
    // Ação para abrir a tela de notificações
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peruaçu', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black), // Ícones pretos
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: _onNotificationPressed, // Abre a tela de notificações
          ),
        ],
      ),
      body:
          _selectedIndex < _screens.length
              ? _screens[_selectedIndex]
              : const SizedBox(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
