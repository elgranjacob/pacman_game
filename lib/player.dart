import 'package:flutter/material.dart';  // Importa el paquete de Material Design de Flutter, necesario para usar los widgets de Flutter.

class MyPlayer extends StatelessWidget {  // Define una clase llamada MyPlayer que extiende StatelessWidget. Este widget no cambia de estado.
  const MyPlayer({super.key});  // Constructor de la clase MyPlayer. Usa 'super.key' para pasar la clave al constructor de la clase base.

  @override
  Widget build(BuildContext context) {  // El método build construye la UI del widget, que se renderiza cuando se llama.
    return Padding(  // Aplica un espacio alrededor del widget. En este caso, se usa Padding para dar un margen alrededor de la imagen.
      padding: const EdgeInsets.all(2.0),  // Aplica un padding de 2.0 píxeles en todos los lados alrededor del widget.
      child: Image.asset(  // El widget Image.asset se utiliza para mostrar una imagen desde el sistema de archivos del proyecto.
        'lib/images/pacman.png'  // Ruta del archivo de imagen que se cargará. En este caso, se busca una imagen llamada 'pacman.png' en el directorio 'lib/images'.
      ),
    );
  }
}
