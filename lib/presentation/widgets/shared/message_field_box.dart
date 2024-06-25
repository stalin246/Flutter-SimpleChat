import 'package:flutter/material.dart';

// Definición de la clase MessageFieldBox que extiende StatelessWidget.
class MessageFieldBox extends StatelessWidget {
  // Constructor de la clase MessageFieldBox.
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador para el campo de texto.
    final textController = TextEditingController();
    // Nodo de enfoque para gestionar el enfoque del campo de texto.
    final focusNode = FocusNode();

    // Define el estilo del borde para el campo de texto cuando está habilitado y enfocado.
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent), // Borde transparente.
      borderRadius: BorderRadius.circular(40) // Bordes redondeados con un radio de 40 píxeles.
    );

    // Configuración de la decoración del campo de texto.
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"', // Texto de pista.
      enabledBorder: outlineInputBorder, // Borde cuando el campo de texto está habilitado.
      focusedBorder: outlineInputBorder, // Borde cuando el campo de texto está enfocado.
      filled: true, // Rellena el fondo del campo de texto.
      // SuffixIcon es un botón de icono que se muestra al final del campo de texto.
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined), // Icono de enviar.
        onPressed: () {
          // Obtiene el valor del campo de texto.
          final textValue = textController.value.text;
          print('button: $textValue'); // Imprime el valor en la consola.
          textController.clear(); // Limpia el campo de texto.
        },
      ),
    );

    // Retorna un campo de texto con el decorado definido.
    return TextFormField(
      // Acción cuando se toca fuera del campo de texto.
      onTapOutside: (event) {
        focusNode.unfocus(); // Pierde el enfoque.
      },
      focusNode: focusNode, // Nodo de enfoque asociado.
      controller: textController, // Controlador asociado.
      decoration: inputDecoration, // Aplica la decoración al campo de texto.
      // Acción cuando el usuario envía el texto (por ejemplo, presionando Enter).
      onFieldSubmitted: (value) {
        print('Submit value $value'); // Imprime el valor enviado en la consola.
        textController.clear(); // Limpia el campo de texto.
        focusNode.requestFocus(); // Solicita el enfoque nuevamente.
      },
    );
  }
}
