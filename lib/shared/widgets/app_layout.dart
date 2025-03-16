import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thesiswork/shared/theme/app_theme.dart';
import 'package:thesiswork/shared/widgets/content_container.dart';
import 'package:thesiswork/shared/widgets/custom_title_bar.dart';
import 'package:thesiswork/shared/widgets/sidebar.dart';

class AppLayout extends ConsumerWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Subtle background pattern
          Positioned.fill(
            child: _buildBackgroundPattern(),
          ),
          
          // Main content
          Column(
            children: [
              // Custom title bar
              const CustomTitleBar(),
              
              // Subtle divider with gradient
              Container(
                height: 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x03252535),  // AppTheme.dividerColor.withOpacity(0.01),
                      Color(0x99252535),  // AppTheme.dividerColor.withOpacity(0.6),
                      Color(0x03252535),  // AppTheme.dividerColor.withOpacity(0.01),
                    ],
                  ),
                ),
              ),
              
              // Main content with sidebar
              const Expanded(
                child: Row(
                  children: [
                    // Sidebar
                     Sidebar(),
                    
                    // Content area
                     Expanded(child: ContentContainer()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildBackgroundPattern() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x990A0A0A),  // AppTheme.backgroundColor.withOpacity(0.6),
            Color(0xF20A0A0A),  // AppTheme.backgroundColor.withOpacity(0.95),
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: CustomPaint(
        painter: PatternPainter(),
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.neonAccent.withOpacity(0.03)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
      
    // Draw subtle grid pattern
    const double spacing = 40;
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }
    
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
    
    // Draw some random circles for depth
    final circlePaint = Paint()
      ..color = const Color(0x026E56CF)  // AppTheme.neonAccent.withOpacity(0.01)
      ..style = PaintingStyle.fill;
      
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.3),
      80,
      circlePaint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.7),
      120,
      circlePaint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.2),
      60,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
} 