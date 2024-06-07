import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: '沈铖  20211060034'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _displayText = 'Flutter Demo';
  bool _isSwitched = false;

  final TextEditingController _counterController = TextEditingController();
  final TextEditingController _displayController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } // 增加计数器数值

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  } // 减少计数器数值

  void _setCounter() {
    final int? newCounter = int.tryParse(_counterController.text);
    if (newCounter != null) {
      setState(() {
        _counter = newCounter;
      });
    }
  } // 设置计数器数值

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  } // 重置计数器数值

  void _setDisplayText() {
    setState(() {
      _displayText = _displayController.text;
    });
  } // 输入文本更改标题

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  } // 是否更改标题的开关

  @override
  Widget build(BuildContext context) {
    var data = '你已经按了这么多次按钮咯:';
    return Scaffold(
      appBar: AppBar(
        title: Text(_displayText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _isSwitched,
              onChanged: _toggleSwitch,
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            if (_isSwitched) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: TextField(
                  controller: _displayController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '更改顶部文本',
                  ),
                  onSubmitted: (_) => _setDisplayText(),
                ),
              ),
              ElevatedButton(
                onPressed: _setDisplayText,
                child: const Text('更新标题'),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
            ],
            Padding(
              padding: const EdgeInsets.only(bottom: 20), 
              child: Text(
                data,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 22, 
                ),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: TextField(
                controller: _counterController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '设置一个数字',
                ),
                onSubmitted: (_) => _setCounter(),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _setCounter,
              child: const Text('设置计数器'),
            ),
          ],
        ),
      ), 
    );
  }

  @override
  void dispose() {
    _counterController.dispose();
    _displayController.dispose();
    super.dispose();
  }
}
