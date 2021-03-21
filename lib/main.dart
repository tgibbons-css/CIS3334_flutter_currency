import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _dollars = 0;
  double _euros = 0;
  double conversionRate = 1.19;

  void _convertToEuros() {
    setState(() {
      _dollars = double.parse(dollarTextField.text);
      _euros = _dollars * conversionRate;
      euroTextField.text = _euros.toStringAsFixed(2);
    });
  }
  void _convertToDollars() {
    setState(() {
      _euros = double.parse(euroTextField.text);
      _dollars =  _euros / conversionRate;
      dollarTextField.text = _dollars.toStringAsFixed(2);
    });
  }
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dollars:',
              style: Theme.of(context).textTheme.headline2,
            ),
            TextField(
              controller: dollarTextField,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text('Convert to Euros'),
              onPressed: () {
                _dollars = double.parse(dollarTextField.text);
                _euros = _dollars * conversionRate;
                euroTextField.text = _euros.toStringAsFixed(2);
              },
            ),
            SizedBox(height: 100),
            Text(
              'Euros:',
              style: Theme.of(context).textTheme.headline2,
            ),
            TextField(
              controller: euroTextField,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: Text('Convert to Dollars'),
              onPressed: _convertToDollars,
              // onPressed: () {
              //   _euros = double.parse(euroController.text);
              //   _dollars =  _euros / conversionRate;
              //   dollarController.text = _dollars.toString();
              // },
            ),
          ],
        ),
      ),
    );
  }
}
