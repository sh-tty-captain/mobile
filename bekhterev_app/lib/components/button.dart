part of 'components.dart';

class ButtonLayout extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? tapColor;
  final TextStyle? textStyle;
  final Size? size;
  final VoidCallback? onTap;

  const ButtonLayout({
    Key? key,
    required this.title,
    this.color,
    this.tapColor,
    this.textStyle,
    this.size,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title.toUpperCase()),
      style: ElevatedButton.styleFrom(
        primary: color ?? Color(0xFFE8C883),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        elevation: 2,
        textStyle: textStyle ?? TextStyle(fontSize: 24.0),
        padding: EdgeInsets.only(top: 12, left: 40, right: 40, bottom: 12),
        minimumSize: size ?? Size(235, 50),
        onSurface: tapColor ?? Color(0xFFF3D38F),
      ),
    );
  }
}
