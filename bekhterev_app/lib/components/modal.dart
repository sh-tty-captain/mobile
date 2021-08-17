part of 'components.dart';

class ModalLayout extends StatelessWidget {
  final String title;
  final Widget? date;
  final Widget? icon;
  final Widget? procedure;
  final Widget? paymentMethod;
  final Widget? cost;
  final Widget? description;
  final VoidCallback? delete;

  const ModalLayout({
    Key? key,
    required this.title,
    this.date,
    this.icon,
    this.procedure,
    this.paymentMethod,
    this.cost,
    this.description,
    this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textWidth = MediaQuery.of(context).size.width * 0.65;

    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.87,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10.0,
            spreadRadius: 0,
            offset: Offset(
              0,
              -4,
            ),
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: textWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title.toUpperCase(),
                          style: Styles.titleModal,
                        ),
                        SizedBox(height: 5),
                        if (date != null) date!,
                        if (date != null) SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    if (icon != null) icon!,
                    SizedBox(width: 10),
                    if (icon != null)
                    AppFilledCircleTapIcon(
                      icon: Icons.delete_outline,
                      color: Color(0xFFD31717),
                      colorSplash: Color(0xFFEC3636),
                      onTap: delete,
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 35),
            if (procedure != null) procedure!,
            if (procedure != null) SizedBox(height: 15),
            if (paymentMethod != null) paymentMethod!,
            if (paymentMethod != null) SizedBox(height: 40),
            if (cost != null) cost!,
            if (cost != null) SizedBox(height: 40),
            if (description != null) description!,
            if (description != null) SizedBox(height: 35),
            SizedBox(height: 35),
            Container(
              alignment: Alignment.center,
              child: ButtonLayout(
                title: 'Закрыть'.toUpperCase(),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
