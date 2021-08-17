part of 'components.dart';

class SladableLayout extends StatelessWidget {
  final String id;
  final String title;
  final Widget child;
  final VoidCallback? onTap;

  const SladableLayout({
    Key? key,
    required this.id,
    required this.title,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Slidable(
          key: ValueKey(id),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          dismissal: SlidableDismissal(
            child: SlidableDrawerDismissal(),
            onDismissed: (actionType) {
              showFlushbar(context, title, ' удалено.');
            },
          ),
          child: child,
          secondaryActions: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: IconSlideAction(
                caption: 'Удалить',
                color: Color(0xFFD31717),
                icon: Icons.delete,
                onTap: onTap,
              ),
            ),
          ],
        ),
        splashColor: Color(0xFFF8D17F),
        highlightColor: Color(0x80F5F6F7),
        onTap: () {},
      ),
    );
  }
}
