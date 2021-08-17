part of 'components.dart';

class AppPageContainer extends StatelessWidget {
  final Widget child;
  final Widget? topInfo;
  final Matrix4? transform;
  final EdgeInsets padding;

  static const kPadding = const EdgeInsets.only(top: 30, bottom: 15);

  const AppPageContainer({
    Key? key,
    required this.child,
    this.topInfo,
    this.transform,
    this.padding = kPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: double.infinity,
          color: Color(0xFF2280CE),
        ),
        if (topInfo != null) topInfo!,
        if (topInfo != null) SizedBox(),
        Expanded(
          child: Container(
            transform: transform != null ? transform : Matrix4.translationValues(0.0, -20.0, 0.0),

            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              child: Container(
                padding: padding,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 0, //extend the shadow
                      offset: Offset(
                        0, // Move to right 10  horizontally
                        -4, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
