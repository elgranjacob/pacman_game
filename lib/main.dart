import 'package:flutter/material.dart';  // Importa el paquete de Material Design de Flutter para usar widgets y otros componentes UI.
import 'homepage.dart';  // Importa el archivo 'homepage.dart', donde se debe encontrar la definición de la pantalla principal.

void main() {
  runApp(const MyApp());  // La función main() inicia la aplicación llamando a runApp, que arranca la aplicación Flutter. En este caso, pasa la instancia de MyApp.
}

class MyApp extends StatelessWidget {  // Define la clase MyApp, que extiende StatelessWidget. StatelessWidget se utiliza cuando el widget no cambia de estado.
  const MyApp({super.key});  // Constructor de MyApp, utiliza un parámetro clave (super.key) que se pasa al constructor de la clase base StatelessWidget.

  @override
  Widget build(BuildContext context) {  // Método build que construye la UI del widget. Aquí es donde se definen los componentes de la aplicación.
    return MaterialApp(  // MaterialApp es un widget que envuelve toda la aplicación para configurar la estructura básica de la interfaz.
      debugShowCheckedModeBanner: false,  // Desactiva el banner de modo de depuración que aparece en la esquina superior derecha en modo debug.
      home: Homepage(),  // Establece la página de inicio de la aplicación como el widget Homepage (definido en homepage.dart).
    );
  }
}
