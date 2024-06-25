
# Aplicación de Chat en Flutter


https://github.com/stalin246/Flutter-SimpleChat/assets/77359338/9b3a97be-29c9-483c-9a67-1dba535faf07


## Descripción
Esta es una aplicación de chat simple construida con Flutter. La aplicación tiene una interfaz de usuario moderna e incluye funciones como enviar y recibir mensajes, mostrar avatares de usuario y manejar la entrada con un campo de mensaje personalizado.

## Resumen de Widgets

### 1. `MyApp`
- **Descripción**: El punto de entrada principal de la aplicación. Configura la estructura básica y el tema de la aplicación.
- **Archivo**: `main.dart`
- **Código**:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';
  import 'package:yes_no_app/setting/theme/app_theme.dart';

  void main() => runApp(const MyApp());

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Si No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen()
      );
    }
  }
  ```

### 2. `AppTheme`
- **Descripción**: Administra la configuración del tema de la aplicación, incluyendo un esquema de colores personalizado.
- **Archivo**: `app_theme.dart`
- **Código**:
  ```dart
  import 'package:flutter/material.dart';

  const Color _customColor = Color(0xff5c11d4);

  const List<Color> _colorThemes = [
    _customColor,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink
  ];

  class AppTheme {
    final int selectedColor;

    AppTheme({
      this.selectedColor = 0
    }) : assert (
      selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
      'Colors must be between 0 and ${_colorThemes.length - 1}'
    );

    ThemeData theme() {
      return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
      );
    }
  }
  ```

### 3. `MessageFieldBox`
- **Descripción**: Un campo de entrada personalizado para escribir y enviar mensajes, con un botón de icono para enviar el texto.
- **Archivo**: `message_field_box.dart`
- **Código**:
  ```dart
  import 'package:flutter/material.dart';

  class MessageFieldBox extends StatelessWidget {
    const MessageFieldBox({super.key});

    @override
    Widget build(BuildContext context) {
      final textController = TextEditingController();
      final focusNode = FocusNode();

      final OutlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40)
      );

      final inputDecoration = InputDecoration(
        hintText: 'Termina tu mensaje con "??"',
        enabledBorder: OutlineInputBorder,
        focusedBorder: OutlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('button: $textValue');
            textController.clear();
          },
        )
      );

      return TextFormField(
        onTapOutside: (event){
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value){
          print('Submit value $value');
          textController.clear();
          focusNode.requestFocus();
        },
      );
    }
  }
  ```

### 4. `MyMessageBubble`
- **Descripción**: Un widget que muestra una burbuja de mensaje para los mensajes del usuario actual.
- **Archivo**: `my_message_bubble.dart`
- **Código**:
  ```dart
  import 'package:flutter/material.dart';

  class MyMessageBubble extends StatelessWidget {
    const MyMessageBubble({super.key});

    @override
    Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('loreefefwefwefewf', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 10)
        ],
      );
    }
  }
  ```

### 5. `HerMessageBubble`
- **Descripción**: Un widget que muestra una burbuja de mensaje para los mensajes de otros usuarios, incluyendo soporte para imágenes.
- **Archivo**: `her_message_bubble.dart`
- **Código**:
  ```dart
  import 'package:flutter/material.dart';

  class HerMessageBubble extends StatelessWidget {
    const HerMessageBubble({super.key});

    @override
    Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Hola como estas?', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 5),
          _ImageBubble(),
          const SizedBox(height: 10),
        ],
      );
    }
  }

  class _ImageBubble extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/2-5df1b403f2654fa77559af1bf2332d7a.gif',
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Kat está enviando la imagen'),
            );
          },
        ),
      );
    }
  }
  ```

### 6. `ChatScreen`
- **Descripción**: La pantalla principal de la aplicación de chat, que muestra la interfaz de chat con mensajes y un campo de entrada de mensajes.
- **Archivo**: `chat_screen.dart`
- **Código**:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
  import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
  import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

  class ChatScreen extends StatelessWidget {
    const ChatScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://ams3.digitaloceanspaces.com/web01.ho-sting/videogamesartwork_com/public/concept-art/1590653694/gravityrush_character_kat_face_02.jpg'),
            ),
          ),
          title: const Text('Kat 😸'),
        ),
        body: _ChatView(),
      );
    }
  }

  class _ChatView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                      ? const HerMessageBubble()
                      : const MyMessageBubble();
                  },
                ),
              ),
              const MessageFieldBox(),
            ],
          ),
        ),
      );
    }
  }
  ```

## Cómo Empezar

1. **Clonar el repositorio**:
   ```sh
   git clone https://github.com/tu-usuario/tu-repo.git
   cd tu-repo
   ```

2. **Instalar dependencias**:
   ```sh
   flutter pub get
   ```

3. **Ejecutar la aplicación**:
   ```sh
   flutter run
   ```

## Contribuciones

¡Las contribuciones son bienvenidas! Por favor, haz un fork de este repositorio y envía un pull request con tus cambios.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo LICENSE para más detalles.

