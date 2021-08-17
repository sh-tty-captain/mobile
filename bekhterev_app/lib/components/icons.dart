part of 'components.dart';

class AppFilledCircleIcon extends StatelessWidget {
  final IconData icon;

  const AppFilledCircleIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      margin: EdgeInsets.only(right: 1),
      decoration: BoxDecoration(
        color: Color(0xFF2280CE),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Icon(icon, size: 25, color: Colors.white),
    );
  }
}

class AppFilledCircleTapIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Color? colorIco;
  final Color? colorSplash;
  final VoidCallback? onTap;

  const AppFilledCircleTapIcon({Key? key, required this.icon, this.color, this.colorIco, this.colorSplash, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 45,
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
          color: color ?? Color(0xFF2280CE),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              print("tapped");
            },
            child: IconButton(
              icon: Icon(icon, color: colorIco ?? Color(0xFFFFFFFF)),
              iconSize: 25,
              splashColor: colorSplash ?? Color(0xFF42A1F0),
              onPressed: onTap,
            ),
          ),
        ));
  }
}