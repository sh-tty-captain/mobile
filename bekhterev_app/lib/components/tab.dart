part of 'components.dart';

class TabLayout extends StatelessWidget {
  final Widget tabNew;
  final Widget tabAll;

  const TabLayout({
    Key? key,
    required this.tabNew,
    required this.tabAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 75,
          width: double.infinity,
          color: Color(0xFF42A1F0),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 75),
                  child: TabBar(
                    indicator: ShapeDecoration(
                        shape: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0, style: BorderStyle.solid)),
                        gradient: LinearGradient(colors: [Color(0xFFE8C883), Color(0xFFE8C883)])),
                    tabs: [
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: new Tab(text: 'Новые'.toUpperCase()),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        child: new Tab(text: 'Все'.toUpperCase()),
                      ),
                    ],
                    labelStyle: Styles.titleTabActive,
                    unselectedLabelStyle: Styles.titleTabDefault,
                  ),
                ),
                Expanded(
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 0, //extend the shadow
                          offset: Offset(
                            0, // Move to right 10  horizontally
                            -4, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: TabBarView(children: [
                      Container(
                        child: tabNew,
                      ),
                      Container(
                        child: tabAll,
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
