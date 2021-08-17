part of 'components.dart';

class PaymentMethodLayout extends StatelessWidget {
  final String? paymentMethod;

  const PaymentMethodLayout({
    Key? key,
    this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Способ оплаты:',
              style: Styles.subtitleModal,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Container(
              width: 32,
              height: 20,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/balance/card.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Mastercard',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF222222)),
                  ),
                  Container(
                    child: Text(
                      '0000 ** 0000',
                      style: TextStyle(fontSize: 15.0, color: Color(0xFF979797)),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
