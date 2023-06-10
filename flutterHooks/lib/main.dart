import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final ageController = useTextEditingController();
    //  these two dont re creating since it has key
    final text = useState(
        ''); // is value notifier that is change notifier has notifylistiner
    final age = useState('');
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      ageController.addListener(() {
        age.value = ageController.text;
      });
      return null;
    }, [
      controller,
      ageController
    ]); // it wont rebuild since it has key, so the controller is assigning as a key
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          TextField(
            controller: ageController,
          ),
          Text(" typed me${text.value}"),
          Text(" age text${age.value}"),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

class Sample with ChangeNotifier {
  ValueNotifier<String> _text = useState('');
  ValueNotifier<String> get text => _text;
}
