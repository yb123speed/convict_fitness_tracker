import 'package:flutter/material.dart';

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '囚徒健身',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FitnessHome(),
    );
  }
}

class FitnessHome extends StatefulWidget {
  @override
  _FitnessHomeState createState() => _FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    TrainingPlanScreen(),
    RecordScreen(), // Moved RecordScreen to the middle
    StatisticsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('囚犯健身记录'),
      // ),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Icon(Icons.directions_run),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue, // 设置选中时的颜色
        unselectedItemColor: Colors.grey, // 设置未选中时的颜色
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: '计划',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '统计',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}

class TrainingPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Plan'),
      ),
      body: Center(
        child: Text('Display the user\'s training plan here'),
      ),
    );
  }
}

class ConvictExercisesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example list of exercises in Prisoner Fitness
    List<String> convictExercises = [
      'Push-ups',
      'Pull-ups',
      'Squats',
      'Lunges',
      'Planks',
      'Burpees',
      'Dips',
      'Mountain Climbers',
      'Leg Raises',
      'Handstand Push-ups'
    ];

    // Create a ListView to display the exercises
    return ListView.builder(
      itemCount: convictExercises.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(convictExercises[index]),
          // Add functionality to record exercise details when tapped
          onTap: () {
            // You can add functionality here to record exercise details
            // when a specific exercise is tapped
          },
        );
      },
    );
  }
}

class RecordWorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Workout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Record your workout details here',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Convict Exercises',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ConvictExercisesWidget(), // Display Convict Exercises widget
            // Add another section for user-defined workout labels
            // You can use text fields or other widgets for user input
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('首页'),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('统计', selectionColor: Color.fromARGB(0, 0, 0, 255)));
  }
}

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('记录'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的'),
    );
  }
}
