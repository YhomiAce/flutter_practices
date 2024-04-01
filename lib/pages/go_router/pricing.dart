import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

class PricingPage extends StatelessWidget {
  final double amount;
  const PricingPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pricing"),
      ),
      body: Center(
        child: MUIPricingCard(
          title: '',
          duration: MUIPricingDuration.yearly,
          currency: MUIPricingCurrency.dollar,
          amount: amount,
          button: const MaterialButton(onPressed: null),
        ),
      ),
    );
  }
}
