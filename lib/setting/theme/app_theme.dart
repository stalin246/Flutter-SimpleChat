import 'package:flutter/material.dart';

// Color personalizado.
const Color _customColor = Color(0xff5c11d4);

// Lista de colores disponibles para el tema.
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

// Clase que define el tema de la aplicación.
class AppTheme {
  final int selectedColor;

  // Constructor de la clase AppTheme.
  AppTheme({
    this.selectedColor = 0
    }) : assert (
      selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
      'Colors must be between 0 and ${_colorThemes.length - 1}'
    ); // Aserción para asegurar que el índice del color es válido.

  // Método que retorna el tema configurado.
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, // Uso de Material 3.
      colorSchemeSeed: _colorThemes[selectedColor], // Color de la lista según el índice seleccionado.
      // brightness: Brightness.dark // Opción para tema oscuro (comentado).
    );
  }
}
