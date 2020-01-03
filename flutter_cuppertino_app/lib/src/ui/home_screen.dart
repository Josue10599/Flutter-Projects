import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Articles'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views'),
          )
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (index == 0) ? Text('Articles') : Text('Views'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text(
                    'This is tab #$index',
                    style:
                        CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(fontSize: 32),
                  ),
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return DetailScreen(index == 0 ? 'Articles' : 'Views');
                      },
                    ));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String topic;

  const DetailScreen(this.topic, {Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CupertinoButton(
                  child: Text('Launch action sheet'),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: Text('Some choices!'),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text('One!'),
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                            isDefaultAction: true,
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Two!'),
                            onPressed: () {
                              Navigator.pop(context, 2);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Three!'),
                            onPressed: () {
                              Navigator.pop(context, 3);
                            },
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
