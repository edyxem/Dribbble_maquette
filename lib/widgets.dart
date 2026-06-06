import 'package:flutter/material.dart';
import 'constants.dart';

/// Badge pill jaune-vert affichant un montant mis en avant
class EarnedBadge extends StatelessWidget {
  final String amount;
  final double fontSize;

  const EarnedBadge({super.key, required this.amount, this.fontSize = 13});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lime,
        borderRadius: BorderRadius.circular(AppDim.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            amount,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: fontSize),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.trending_up_rounded,
            size: 14,
            color: AppColors.darkGreen,
          ),
        ],
      ),
    );
  }
}

/// Ligne de transaction (dépôt ou retrait)
class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String cryptoAmount;
  final bool isDeposit;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.cryptoAmount,
    required this.isDeposit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 14),
          Expanded(child: _buildLabels()),
          _buildAmounts(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    final colors = isDeposit
        ? [const Color(0xFF7DCCA0), const Color(0xFF3A7A5A)]
        : [const Color(0xFFFF9999), const Color(0xFFBB3333)];

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: const Alignment(-0.3, -0.3),
          radius: 0.9,
          colors: colors,
        ),
      ),
    );
  }

  Widget _buildLabels() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodyMedium),
        const SizedBox(height: 3),
        Text(date, style: AppTextStyles.label),
      ],
    );
  }

  Widget _buildAmounts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          amount,
          style: isDeposit
              ? AppTextStyles.amountPositive
              : AppTextStyles.amountNegative,
        ),
        const SizedBox(height: 3),
        Text(cryptoAmount, style: AppTextStyles.label),
      ],
    );
  }
}

/// Barre de navigation inférieure avec bouton Transfer central
class AppBottomNav extends StatelessWidget {
  final VoidCallback? onTransferTap;

  const AppBottomNav({super.key, this.onTransferTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDim.navHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavIcon(icon: Icons.home_rounded, onTap: () {}),
          _TransferButton(onTap: onTransferTap),
          _NavIcon(icon: Icons.grid_view_rounded, onTap: () {}),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: AppColors.darkGreen, size: 26),
      ),
    );
  }
}

class _TransferButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _TransferButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDDFF77), Color(0xFFBBEE33)],
          ),
          borderRadius: BorderRadius.circular(AppDim.radiusFull),
          boxShadow: [
            BoxShadow(
              color: AppColors.lime.withOpacity(0.45),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.swap_vert_rounded,
              color: AppColors.darkGreen,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text('Transfer', style: AppTextStyles.button),
          ],
        ),
      ),
    );
  }
}

/// Avatar circulaire — image réelle depuis assets
class UserAvatar extends StatelessWidget {
  final double size;

  const UserAvatar({super.key, this.size = AppDim.avatarSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 1.5),
      ),
      child: ClipOval(
        child: Image.asset(
          'images/avatar.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFFD4956A), Color(0xFFB06040)],
              ),
            ),
            child: Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: size * 0.55,
            ),
          ),
        ),
      ),
    );
  }
}

/// Bouton plein réutilisable (Deposit / Purchase)
class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isLight;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    this.isLight = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: isLight ? AppColors.lime : null,
          gradient: isLight
              ? null
              : const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF3D6A50), Color(0xFF1B3A2D)],
                ),
          borderRadius: BorderRadius.circular(AppDim.radiusFull),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isLight ? AppColors.darkGreen : Colors.white,
                size: 16,
              ),
              const SizedBox(width: 7),
              Text(
                label,
                style: AppTextStyles.button.copyWith(
                  color: isLight ? AppColors.darkGreen : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Graphique zone (area chart) — écran investissement
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawAreaFill(canvas, size);
    _drawCurveLine(canvas, size);
    _drawDottedVertical(canvas, size);
    _drawDataPoint(canvas, size);
    _drawAxisLabels(canvas, size);
  }

  void _drawAreaFill(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.85)
      ..cubicTo(
        size.width * 0.25,
        size.height * 0.85,
        size.width * 0.50,
        size.height * 0.65,
        size.width * 0.72,
        size.height * 0.28,
      )
      ..cubicTo(
        size.width * 0.80,
        size.height * 0.12,
        size.width * 0.88,
        size.height * 0.18,
        size.width,
        size.height * 0.10,
      )
      ..lineTo(size.width, size.height * 0.78)
      ..lineTo(0, size.height * 0.85)
      ..close();

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFCCFF57).withOpacity(0.55),
          const Color(0xFFCCFF57).withOpacity(0.04),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, paint);
  }

  void _drawCurveLine(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.85)
      ..cubicTo(
        size.width * 0.25,
        size.height * 0.85,
        size.width * 0.50,
        size.height * 0.65,
        size.width * 0.72,
        size.height * 0.28,
      )
      ..cubicTo(
        size.width * 0.80,
        size.height * 0.12,
        size.width * 0.88,
        size.height * 0.18,
        size.width,
        size.height * 0.10,
      );

    final paint = Paint()
      ..color = const Color(0xFF3D7A5A)
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, paint);
  }

  void _drawDottedVertical(Canvas canvas, Size size) {
    const dotRadius = 1.8;
    const gap = 6.0;
    final x = size.width * 0.72;
    final startY = size.height * 0.28;
    final endY = size.height * 0.78;
    final paint = Paint()
      ..color = const Color(0xFF3D7A5A).withOpacity(0.4)
      ..style = PaintingStyle.fill;

    double y = startY;
    while (y < endY) {
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
      y += gap + dotRadius * 2;
    }
  }

  void _drawDataPoint(Canvas canvas, Size size) {
    final cx = size.width * 0.72;
    final cy = size.height * 0.28;

    canvas.drawCircle(
      Offset(cx, cy),
      13,
      Paint()
        ..color = const Color(0xFF1B3A2D).withOpacity(0.15)
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      Offset(cx, cy),
      6,
      Paint()..color = const Color(0xFF1B3A2D),
    );
    canvas.drawCircle(Offset(cx, cy), 3, Paint()..color = Colors.white);
  }

  void _drawAxisLabels(Canvas canvas, Size size) {
    const style = TextStyle(
      color: Color(0xFF8A9A90),
      fontSize: 11,
      fontFamily: 'sans-serif',
    );

    void drawLabel(String text, double x, double y) {
      final tp = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x, y));
    }

    final labelY = size.height * 0.82;
    drawLabel('Today', 0, labelY);
    drawLabel('6m', size.width * 0.47, labelY);
    drawLabel('12m', size.width * 0.88, labelY);
  }

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) => false;
}
