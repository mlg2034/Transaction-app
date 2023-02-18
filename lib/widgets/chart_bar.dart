import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
const  ChartBar(
      {required this.spendingAmount,
      required this.spendingPctOfTotal,
      required this.label});
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: [
            Container(
              height: constrains.maxHeight*0.15,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
             SizedBox(
              height:  constrains.maxHeight*0.05,
            ),
            Container(
              height:  constrains.maxHeight*0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
             SizedBox(
              height:  constrains.maxHeight*0.05,
            ),
            Container(
              height:  constrains.maxHeight*0.15,
              child: FittedBox(child: Text(label)),),
          ],
        );
      },
    );
  }
}
