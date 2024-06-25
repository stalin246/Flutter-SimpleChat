import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

// Definición de la clase ChatScreen que extiende StatelessWidget.
class ChatScreen extends StatelessWidget {
  // Constructor de la clase ChatScreen.
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna un widget Scaffold que proporciona la estructura básica de la pantalla.
    return Scaffold(
      // Configuración de la barra de aplicaciones.
      appBar: AppBar(
        // Icono de usuario al principio de la barra de aplicaciones.
        leading: const Padding(
          padding: EdgeInsets.all(4.0), // Espaciado alrededor del avatar.
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://ams3.digitaloceanspaces.com/web01.ho-sting/videogamesartwork_com/public/concept-art/1590653694/gravityrush_character_kat_face_02.jpg'), // Imagen de perfil desde una URL.
          ),
        ),
        // Título de la barra de aplicaciones.
        title: const Text('Kat 😸'),
      ),
      // Cuerpo de la pantalla que contiene la vista de chat.
      body: _ChatView(),
    ); 
  }
}

// Definición de la clase _ChatView que extiende StatelessWidget.
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SafeArea para asegurar que el contenido no se superponga con las áreas del sistema operativo.
    return SafeArea(
      // Padding para agregar espacio horizontal alrededor del contenido.
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10), // Padding horizontal.
        // Column para organizar los widgets en una estructura vertical.
        child: Column(
          children: [
            // Expanded para que el ListView ocupe todo el espacio disponible.
            Expanded(
              // ListView.builder para crear una lista desplazable de elementos.
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // Condición ternaria para alternar entre HerMessageBubble y MyMessageBubble.
                  return (index % 2 == 0)
                    ? const HerMessageBubble() // Si el índice es par, muestra HerMessageBubble.
                    : const MyMessageBubble(); // Si el índice es impar, muestra MyMessageBubble.
                },
              ),
            ),
            // Caja de texto para enviar mensajes.
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
