import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NodeLearn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<List<String>> datasets = [];
  List<List<String>> models = [];
  List<List<String>> losses = [];
  List<List<String>> accuracies = [];
  List<List<String>> predictions = [];
  List<List<String>> crowdwork = [];

  @override
  void initState() {
    super.initState();

    datasets.add(["MNIST", "selected"]);
    datasets.add(["Fashion MNIST", ""]);
    datasets.add(["SVHN", ""]);
    datasets.add(["CIFAR-10", ""]);
    datasets.add(["Cats vs Dogs", ""]);
    datasets.add(["Moons", ""]);
    datasets.add(["Celeb-A", ""]);
    datasets.add(["Youtube-8M", ""]);
    datasets.add(["Jeopardy", ""]);

    models.add(["Statitical", ""]);
    models.add(["Dense Neural Network", "selected"]);
    models.add(["Convolutional NN", ""]);
    models.add(["Recurrent NN", ""]);
    models.add(["SVM", ""]);

    losses.add(["MSE", "selected"]);
    losses.add(["MAE", ""]);
    losses.add(["KL Div", ""]);

    accuracies.add(["Acc", "selected"]);
    accuracies.add(["Precision", ""]);
    accuracies.add(["Recall", ""]);
    accuracies.add(["Visual Insp.", ""]);

    predictions.add(["Real vs. Pred", ""]);
    predictions.add(["Draw something", "selected"]);

    crowdwork.add(["Upload labelled data !", ""]);
    crowdwork.add(["Create synthetic data", "selected"]);
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double safeheight = screenheight - padding.top - padding.bottom;

    double listheight = safeheight / 8;
    double listwidth = screenwidth / 2;

    void _trainModel() {}
    void _predictFromModel() {}
    void _saveExample() {}

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent.shade200,
          title: Text("NodeLearn"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: listheight,
                width: listwidth,
                child: ScrollableList(
                  items: datasets,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                ),
              ),
              SizedBox(
                height: listheight,
                width: listwidth,
                child: ScrollableList(
                  items: models,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightGreen,
                ),
              ),
              SizedBox(
                height: listheight,
                width: listwidth,
                child: ScrollableList(
                  items: losses,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightBlue,
                ),
              ),
              FloatingActionButton(
                onPressed: _trainModel,
                tooltip: 'Train the model',
                child: const Text("Train"),
              ),
              SizedBox(
                height: listheight,
                width: listwidth,
                child: ScrollableList(
                  items: predictions,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                ),
              ),
              FloatingActionButton(
                onPressed: _predictFromModel,
                tooltip: 'Predict from the trained model',
                child: const Text("Predict"),
              ),
              SizedBox(
                height: listheight,
                width: listwidth,
                child: ScrollableList(
                  items: crowdwork,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurpleAccent.shade200,
                ),
              ),
              FloatingActionButton(
                onPressed: _saveExample,
                tooltip: 'Save the example to the dataset',
                child: const Text("Save"),
              ),
            ],
          ),
        ));
  }
}

class ScrollableList extends StatefulWidget {
  final List<List<String>> items;
  final Color backgroundColor, foregroundColor;

  const ScrollableList(
      {super.key,
      required this.items,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.lightGreen});

  @override
  State<StatefulWidget> createState() => ScrollableListState();
}

class ScrollableListState extends State<ScrollableList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // TODO use ListWheelScrollView instead
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              decoration: BoxDecoration(
                color: widget.items[index][1] == "selected"
                    ? widget.foregroundColor
                    : widget.backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              height: 80,
              width: 200,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(4),
              child: Center(child: Text(widget.items[index][0])),
            ),
            onTap: () {
              for (final item in widget.items) {
                if (item[1] == 'selected') item[1] = '';
              }
              setState(() => widget.items[index][1] = 'selected');
            },
          );
        });
  }
}
