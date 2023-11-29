import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MiPagina(),
    );
  }
}

class MiPagina extends StatelessWidget {
  const MiPagina({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 260,
          height: 260,
          // NOTA: Color de fondo que era gris y lo cambie por transparente, pero simplemente se podría quitar solo que lo dejo de referencia
          color: Colors.transparent,
          // NOTA: Ojo si no especificamos el size el tamaño que va a tener el CustomPaint va a ser todo el temaño del padre,
          //       que sería el container de 260 x 260 pixeles
          child: CustomPaint(
            // NOTA: El painter tiene que ser una instancia de una clase heredad del CustomPainter
            painter: MiPainterPersonalizado(),
          ),
        ),
      ),
    );
  }
}

class MiPainterPersonalizado extends CustomPainter {
  // NOTA: Para dibujar yo voy a ocupar como mínimo dos cosas:
  //       La primera es el lápiz que va a ser el que va a dibujar el contorno o como quiero que se pinte
  //       El segundo va a ser el path que yo quiero que se dibuje dentro del contenedor
  @override
  void paint(Canvas canvas, Size size) {
    //------------
    // Lápiz
    //------------
    final paint = Paint()
      ..color = const Color(0xff21232A)
      // NOTA: Tamaño de la línea
      ..strokeWidth = 5
      // NOTA: Border redondeados de la línea
      ..strokeCap = StrokeCap.round
      // NOTA: Stroke solo la línea y fill es el reyeno de la figura
      ..style = PaintingStyle.stroke;

    // NOTA: Cuando usamos el .. es lo mismo que si hicieramos lo siguiente para definir las propiedades:
    /*
      paint.color = Color(0xff21232A);
    */

    //------------
    // Path
    //------------
    final path = Path();

    //------------------
    // Ejemplo
    //------------------
    /*
    // NOTA: Esto es como si tuvieramos un plano carteciano donde tenemos que definir coordenadas en X y Y
    // La mitad o 50% del tamaño en X
    path.lineTo(size.width * 0.5, 0);
    // La mitad o 50% del tamaño en X y en Y
    path.lineTo(size.width * 0.5, size.height * 0.5);
    // La mitad o 50% del tamaño en Y
    path.lineTo(0, size.height * 0.5);
    // Máximo valor en Y
    path.lineTo(0, size.height);
    // Máximo valor en X y en Y
    path.lineTo(size.width, size.height);

    // Y así sucesivamente
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    */

    //-----------------------
    // Figura más elaborada
    //-----------------------
    // Nos movemos sin dibujar. Primer línea vertical
    path.moveTo(size.width * 0.3333, 0);
    // Dibujamos la línea
    path.lineTo(size.width * 0.3333, size.height);

    // Nos movemos sin dibujar. Segunda línea vertical
    path.moveTo(size.width * 0.6666, 0);
    // Dibujamos la línea
    path.lineTo(size.width * 0.6666, size.height);

    // Nos movemos sin dibujar. Primera línea horizontal
    path.moveTo(0, size.height * 0.3333);
    // Dibujamos la línea
    path.lineTo(size.width, size.height * 0.3333);

    // Nos movemos sin dibujar. Segunda línea horizontal
    path.moveTo(0, size.height * 0.6666);
    // Dibujamos la línea
    path.lineTo(size.width, size.height * 0.6666);

    // NOTA: Le decimos al CustomPainter que se dibuje
    canvas.drawPath(path, paint);
  }

  // NOTA: EL shouldRepaint lo voy a dejar en true ya que quiro que se redibuje cada vez que haga un cambio
  @override
  bool shouldRepaint(MiPainterPersonalizado oldDelegate) => true;

  // NOTA: Quite el shouldRebuildSemantics ya que me voy a enfocar solo en el paint y el shouldRepaint
}
