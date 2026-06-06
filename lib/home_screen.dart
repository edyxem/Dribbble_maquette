import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    _buildHeader(),
                    const SizedBox(height: 36),
                    _buildBalanceSection(context),
                    _buildWaveIllustration(context),
                    _buildTransactionsCard(),
                  ],
                ),
              ),
            ),
            AppBottomNav(
              onTransferTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DetailScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hello', style: AppTextStyles.greeting),
        const SizedBox(width: 10),
        const UserAvatar(),
        const SizedBox(width: 10),
        Text(
          'Martin',
          style: AppTextStyles.greeting.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildBalanceSection(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDim.paddingH),
      child: Column(
        children: [
          Text(
            'You have earned',
            style: AppTextStyles.body.copyWith(color: AppColors.textMuted),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EarnedBadge(amount: '\$6,998.71'),
              const SizedBox(width: 10),
              Text('for a balance of', style: AppTextStyles.label),
            ],
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '\$ 172,101.87',
              style: AppTextStyles.displayLarge.copyWith(fontSize: w * 0.115),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaveIllustration(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: h * 0.27,
      child: Image.asset(
        'images/wave_bg.png',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE0F0E8), Color(0xFF8ABCAA), Color(0xFF2D3F50)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionsCard() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(
        AppDim.paddingH,
        22,
        AppDim.paddingH,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Transactions', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 4),
          const TransactionTile(
            title: 'Deposit',
            date: 'Feb 23, 21:30',
            amount: '\$301.11',
            cryptoAmount: 'BTC 0.00003381',
            isDeposit: true,
          ),
          Divider(color: AppColors.divider, height: 1),
          const TransactionTile(
            title: 'Withdrawal',
            date: 'Feb 23, 21:30',
            amount: '-\$5,301.11',
            cryptoAmount: 'BTC 0.06001268',
            isDeposit: false,
          ),
        ],
      ),
    );
  }
}
