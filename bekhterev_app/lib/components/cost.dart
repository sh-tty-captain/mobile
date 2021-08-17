part of 'components.dart';

class CostLayout extends StatelessWidget {
  final String costData;

  const CostLayout({
    Key? key,
    required this.costData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Стоимость:',
              style: Styles.titleCost,
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              costData,
              style: Styles.titleCostData,
            ),
          ),
        ),
      ],
    );
  }
}
