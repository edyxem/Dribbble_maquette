import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _oneTimeAmount = 1000;
  double _monthlyAmount = 5;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: AppDim.paddingH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              _buildBackButton(context),
              const SizedBox(height: 20),
              _buildEarnedSection(size),
              const SizedBox(height: 16),
              _buildChart(size),
              const SizedBox(height: 28),
              _buildInvestmentSlider(
                label: 'One-Time Investment',
                value: _oneTimeAmount,
                min: 100,
                max: 10000,
                onChanged: (v) => setState(() => _oneTimeAmount = v),
              ),
              const SizedBox(height: 24),
              _buildInvestmentSlider(
                label: 'Monthly Investment',
                value: _monthlyAmount,
                min: 1,
                max: 500,
                onChanged: (v) => setState(() => _monthlyAmount = v),
              ),
              const SizedBox(height: 36),
              _buildActionButtons(),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.chevron_left_rounded,
          color: AppColors.darkGreen,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildEarnedSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You have earned',
          style: AppTextStyles.body.copyWith(color: AppColors.textMuted),
        ),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text('\$ 58.32', style: AppTextStyles.displaySmall),
        ),
        const SizedBox(height: 10),
        const EarnedBadge(amount: '\$20.23 per week'),
      ],
    );
  }

  Widget _buildChart(Size size) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.22,
      child: CustomPaint(painter: ChartPainter()),
    );
  }

  Widget _buildInvestmentSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: 4),
        Text(
          '\$${value.toStringAsFixed(0)}',
          style: AppTextStyles.displayMedium,
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.darkGreen,
            inactiveTrackColor: const Color(0xFFDDE5E0),
            thumbColor: AppColors.darkGreen,
            overlayColor: AppColors.darkGreen.withOpacity(0.08),
            trackHeight: 2.0,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 9,
              elevation: 3,
            ),
          ),
          child: Slider(value: value, min: min, max: max, onChanged: onChanged),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ActionButton(
            label: 'Deposit',
            icon: Icons.arrow_downward_rounded,
            isLight: false,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ActionButton(
            label: 'Purchase',
            icon: Icons.add_rounded,
            isLight: true,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
