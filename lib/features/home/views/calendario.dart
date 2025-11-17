import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final eventos = [
      {'numero': '1', 'texto': 'Reunión con el equipo'},
      {'numero': '2', 'texto': 'Presentación del proyecto'},
      {'numero': '3', 'texto': 'Revisión de progreso'},
      {'numero': '4', 'texto': 'Entrega final'},
      {'numero': '5', 'texto': 'Retroalimentación del cliente'},
      {'numero': '6', 'texto': 'Cierre de sprint'},
      {'numero': '7', 'texto': 'Planeación siguiente etapa'},
    ];

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFE81236), Color(0xFF370B12)],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 🔺 Parte superior
            Positioned(
              top: height * 0.07,
              left: 50,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'lib/assets/images/Calendar.svg',
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Calendario",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/TalentTrack.svg',
                    height: 150,
                  ),
                ],
              ),
            ),

            /// 🔹 Cuadro blanco inferior
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.75,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, -4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),

                      /// 🔸 Título del mes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                          const Text(
                            "Julio 2025",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// 🔸 Cuadro principal (placeholder)
                      Container(
                        height: height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,
                        ),
                      ),

                      const SizedBox(height: 20),
                      Divider(color: Colors.grey.shade300, thickness: 1),
                      const SizedBox(height: 5),
                      const Text(
                        "Fechas importantes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),

                      /// 🔸 Lista de eventos con separación
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.10, // 10% del alto
                            top: size.height * 0.02, // 2% del alto
                          ),
                          itemCount: eventos.length,
                          itemBuilder: (context, index) {
                            final evento = eventos[index];
                            final bool isLast = index == eventos.length - 1;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  if (!isLast)
                                    Positioned(
                                      left: 12,
                                      top: 25,
                                      bottom: -25,

                                      child: CustomPaint(
                                        painter: DashedLinePainter(),
                                      ),
                                    ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Color(0xFFE81236),
                                              Color(0xFF370B12),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),

                                      Text(
                                        evento['numero']!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(width: 20),

                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 18,
                                          ),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color(0xFFE81236),
                                                Color(0xFF370B12),
                                              ],
                                            ),
                                          ),
                                          child: Text(
                                            evento['texto']!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Línea discontinua vertical entre cada bolita
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashHeight = 7;
    const double dashSpace = 5;
    double startY = 0;

    final paint =
        Paint()
          ..color = Colors.grey.shade400
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
