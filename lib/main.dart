import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app/setting/theme/app_theme.dart';

// Punto de entrada principal de la aplicación.
void main() => runApp(const MyApp());

// Definición de la clase MyApp que extiende StatelessWidget.
class MyApp extends StatelessWidget {
  // Constructor de la clase MyApp.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna un widget MaterialApp que configura la estructura básica de la aplicación.
    return MaterialApp(
      title: 'Simple Chat', // Título de la aplicación.
      debugShowCheckedModeBanner: false, // Desactiva el banner de depuración.
      theme: AppTheme(selectedColor: 0).theme(), // Aplica el tema de la aplicación con un color específico.
      home: const ChatScreen() // Define la pantalla principal de la aplicación.
    );
  }
}
