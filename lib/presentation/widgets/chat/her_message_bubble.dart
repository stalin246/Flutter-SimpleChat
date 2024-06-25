import 'package:flutter/material.dart';

// Definición de la clase HerMessageBubble que extiende StatelessWidget.
class HerMessageBubble extends StatelessWidget {
  // Constructor de la clase HerMessageBubble.
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el esquema de color del tema actual.
    final colors = Theme.of(context).colorScheme; // Busca el tema global para obtener el esquema de colores.
    
    // Retorna un widget Column que organiza los widgets en una estructura vertical.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea los hijos al inicio en el eje horizontal (izquierda).
      children: [
        // Container que envuelve el mensaje.
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Utiliza el color secundario del tema.
            borderRadius: BorderRadius.circular(20) // Bordes redondeados para el contenedor.
          ),
          // Padding para añadir espacio alrededor del texto.
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding horizontal y vertical.
            // Texto del mensaje.
            child: Text(
              'Hola como estas?', // Mensaje de ejemplo.
              style: TextStyle(color: Colors.white), // Color del texto.
            ),
          ),
        ),
        // Añade un espacio vertical entre el contenedor y el siguiente widget.
        const SizedBox(height: 5), // Separación entre elementos.
        // Añade un widget personalizado para mostrar una imagen.
        _ImageBubble(), // Widget para mostrar una imagen.
        const SizedBox(height: 10), // Separación vertical adicional.
      ],
    );
  }
}

// Definición de la clase _ImageBubble que extiende StatelessWidget.
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla.
    final size = MediaQuery.of(context).size;

    // Retorna un widget ClipRRect para recortar la imagen con bordes redondeados.
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Bordes redondeados para la imagen.
      // Image.network para cargar una imagen desde una URL.
      child: Image.network(
        'https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif', // URL de la imagen.
        width: size.width * 0.7, // Ancho de la imagen, 70% del ancho de la pantalla.
        height: 150, // Altura de la imagen.
        fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el contenedor.
        // loadingBuilder se ejecuta mientras la imagen se carga.
        loadingBuilder: (context, child, loadingProgress) { // Se ejecuta en tiempo de ejecución.
          if (loadingProgress == null) return child; // Si la imagen se ha cargado, retorna la imagen.

          // Muestra un mensaje mientras la imagen se está cargando.
          return Container(
            width: size.width * 0.7, // Mantiene el ancho del contenedor mientras carga.
            height: 150, // Mantiene la altura del contenedor mientras carga.
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Padding alrededor del texto.
            child: const Text('Kat está enviando la imagen'), // Mensaje de carga.
          );
        },
      ),
    );
  }
}
