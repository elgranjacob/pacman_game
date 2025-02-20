import 'package:flutter/material.dart';  // Importa el paquete de Material Design de Flutter para usar widgets y otros componentes UI.

class MyPixel extends StatelessWidget {  // Define una clase llamada MyPixel que extiende StatelessWidget. Esto significa que el widget es inmutable.
  final innerColor;  // Declara una propiedad 'innerColor', que se usará para el color interno del contenedor.
  final outerColor;  // Declara una propiedad 'outerColor', que se usará para el color externo del contenedor.
  final child;  // Declara una propiedad 'child', que puede ser cualquier widget que se colocará dentro del contenedor.

  const MyPixel({super.key, this.innerColor, this.outerColor, this.child});  // Constructor de MyPixel que recibe valores para 'innerColor', 'outerColor' y 'child', todos opcionales.

  @override
  Widget build(BuildContext context) {  // El método build construye la UI del widget, que se renderiza cuando se llama.
    return Padding(  // Aplica un espacio alrededor del widget.
      padding: const EdgeInsets.all(1.0),  // Define un margen de 1.0 en todos los lados del widget.
      child: ClipRRect(  // Aplica un borde redondeado a un widget hijo.
        borderRadius: BorderRadius.circular(6),  // Borde redondeado con un radio de 6 píxeles en el contenedor exterior.
        child: Container(  // Un contenedor que permite la modificación de propiedades como color, padding, etc.
          padding: EdgeInsets.all(4),  // Aplica un padding de 4 píxeles en todos los lados dentro del contenedor.
          color: outerColor,  // Establece el color del contenedor exterior usando la propiedad 'outerColor'.
          child: ClipRRect(  // Aplica un borde redondeado al contenedor interior.
            borderRadius: BorderRadius.circular(10),  // Borde redondeado con un radio de 10 píxeles en el contenedor interior.
            child: Container(  // Un contenedor anidado dentro del anterior, con más padding y color.
              padding: EdgeInsets.all(4),  // Padding de 4 píxeles en todos los lados dentro del contenedor interior.
              color: innerColor,  // Establece el color del contenedor interior usando la propiedad 'innerColor'.
              child: Center(child: child),  // Centra el widget hijo dentro del contenedor interior.
            ),
          ),
        ),
      ),
    );
  }
}
