part of 'components.dart';

class AppListEntryLayout extends StatelessWidget {
  final Widget title;
  final Widget? subTitle;
  final Widget? prefix;
  final Widget? sufix;
  final VoidCallback? onTap;

  const AppListEntryLayout({
    Key? key,
    required this.title,
    this.subTitle,
    this.prefix,
    this.sufix,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE5E5E5),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (prefix != null) prefix!,
                if (prefix != null) SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      title,
                      SizedBox(height: 1),
                      if (subTitle != null) subTitle!,
                      if (subTitle != null) SizedBox(),
                    ],
                  ),
                ),
                if (sufix != null) SizedBox(width: 15),
                if (sufix != null) sufix!,
              ],
            ),
          ),
        ),
        splashColor: Color(0xFFF8D17F),
        highlightColor: Color(0x80F5F6F7),
        onTap: onTap,
      ),
    );
  }
}
