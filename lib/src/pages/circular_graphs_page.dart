
import 'package:flutter/material.dart';
import 'package:fulldesigns/src/theme/theme_app.dart';
import 'package:fulldesigns/src/widgets/circularprogress.dart';
import 'package:provider/provider.dart';

class CircularGraphsPage extends StatefulWidget {

  @override
  _CircularGraphsPageState createState() => _CircularGraphsPageState();
}

class _CircularGraphsPageState extends State<CircularGraphsPage> {

  double percentage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeApp>(context).currentTheme;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "up",
            onPressed: (){ setState(() { if(percentage<100) percentage+=10;});  },
            child: Icon(Icons.arrow_upward),
          ),
          SizedBox(height:8),
          FloatingActionButton(
            heroTag: "down",
            onPressed: (){ setState(() { if(percentage>0) percentage-=10; });  },
            child: Icon(Icons.arrow_downward),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: CircularProgress(
                    percentage: percentage,
                    color: Colors.orange,
                    back: theme.textTheme.bodyText2.color,
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: CircularProgress(
                    percentage: percentage,
                    color: Colors.deepPurple,
                    back: theme.textTheme.bodyText2.color,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: CircularProgress(
                    percentage: percentage,
                    color: Colors.redAccent,
                    back: theme.textTheme.bodyText2.color,
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: CircularProgress(
                    percentage: percentage,
                    color: Colors.blue,
                    back: theme.textTheme.bodyText2.color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}