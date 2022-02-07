import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPercentOfTotal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (ctx, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)} ')),
          SizedBox(
            height: mediaQuery.size.height > 800 ? constraints.maxHeight * 0.63 : constraints.maxHeight * 0.56 ,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(
                      220,
                      220,
                      220,
                      1.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
              height: constraints.maxHeight * 0.15,
              child: Text(label),
          ),
        ],
      ));
  }
}
