part of 'components.dart';

class AppNormalHeader extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const AppNormalHeader(
    this.text, {
    Key? key,
    this.color,
    this.textAlign,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: color ?? Color(0xFF222222),
      ),
    );
  }
}

class AppNormalText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const AppNormalText(
    this.text, {
    Key? key,
    this.color,
    this.textAlign,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 15.0,
        color: color ?? Color(0xFF222222),
      ),
    );
  }
}
