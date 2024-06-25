import 'package:flutter/material.dart';

// Definición de la clase MyMessageBubble que extiende StatelessWidget.
class MyMessageBubble extends StatelessWidget {
  // Constructor de la clase MyMessageBubble.
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el esquema de color del tema actual.
    final colors = Theme.of(context).colorScheme; // Busca el tema global para obtener el esquema de colores.
    
    // Retorna un widget Column que organiza los widgets en una estructura vertical.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Alinea los hijos al final en el eje horizontal (derecha).
      children: [
        // Container que envuelve el mensaje.
        Container(
          decoration: BoxDecoration(
            color: colors.primary, // Utiliza el color primario del tema.
            borderRadius: BorderRadius.circular(20) // Bordes redondeados para el contenedor.
          ),
          // Padding para añadir espacio alrededor del texto.
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding horizontal y vertical.
            // Texto del mensaje.
            child: Text(
              'loreefefwefwefewf', // Mensaje de ejemplo.
              style: TextStyle(color: Colors.white), // Color del texto.
            ),
          ),
        ),
        // Añade un espacio vertical entre el contenedor y el siguiente widget.
        const SizedBox(height: 10) // Separación entre elementos.
      ],
    );
  }
}
