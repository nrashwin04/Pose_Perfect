import 'package:flutter/material.dart';

void main() => runApp(BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double _height = 160;
  double _weight = 60;
  int _age = 20;
  bool _isMale = true;

  void _calculateBMI() {
    double heightInMeters = _height / 100;
    double bmi = _weight / (heightInMeters * heightInMeters);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BMIResultPage(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff95D5B2),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFF1B4332)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGenderCard('Male', Icons.male, _isMale, () {
                  setState(() => _isMale = true);
                }),
                _buildGenderCard('Female', Icons.female, !_isMale, () {
                  setState(() => _isMale = false);
                }),
              ],
            ),
            SizedBox(height: 20),
            _buildSliderCard('Height', '${_height.toStringAsFixed(1)} cm',
                _height, 100, 220, (value) {
              setState(() => _height = value);
            }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildValueCard('Weight', '${_weight.toStringAsFixed(1)} kg',
                    () {
                  setState(() => _weight -= 0.25);
                }, () {
                  setState(() => _weight += 0.25);
                }),
                _buildValueCard('Age', '$_age', () {
                  setState(() => _age -= 1);
                }, () {
                  setState(() => _age += 1);
                }),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff081C15),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xffD8F3DC)),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard(
      String gender, IconData icon, bool isSelected, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Card(
        color: isSelected ? Color(0xff2D6A4F) : Color(0xff74C69D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 100,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Color(0xffD8F3DC)),
              SizedBox(height: 10),
              Text(gender, style: TextStyle(color: Color(0xffD8F3DC))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderCard(
      String label, String value, double sliderValue, double min, double max, Function(double) onChanged) {
    return Card(
      color: Color(0xff2D6A4F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(color: Color(0xffD8F3DC), fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Poppins')),
            Text(value, style: TextStyle(color: Color(0xffB7E4C7), fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Monsterrat')),
            Slider(
              value: sliderValue,
              min: min,
              max: max,
              activeColor: Color(0xff95D5B2),
              inactiveColor: const Color.fromARGB(255, 44, 63, 45),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueCard(String label, String value, Function onDecrease, Function onIncrease) {
    return Card(
      color: Color(0xff40916C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(label, style: TextStyle(color: Color(0xffD8F3DC), fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Poppins')),
            Text(value, style: TextStyle(color: Color(0xffB7E4C7), fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Monsterrat')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Color(0xffD8F3DC), size: 30,),
                  onPressed: () => onDecrease(),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Color(0xffD8F3DC), size: 30,),
                  onPressed: () => onIncrease(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BMIResultPage extends StatelessWidget {
  final double bmi;

  BMIResultPage({required this.bmi});

  @override
  Widget build(BuildContext context) {
    String result;
    String message;
    Color resultColor;

    if (bmi < 18.5) {
      result = 'UNDERWEIGHT';
      message = 'You need to gain some weight.';
      resultColor = Colors.blue;
    } else if (bmi < 24.9) {
      result = 'NORMAL';
      message = 'You have a normal body weight. Good job!';
      resultColor = Colors.green;
    } else if (bmi < 29.9) {
      result = 'OVERWEIGHT';
      message = 'Consider exercising more.';
      resultColor = Colors.orange;
    } else {
      result = 'OBESE';
      message = 'Seek advice from a healthcare provider.';
      resultColor = Colors.red;
    }

    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff95D5B2),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFF1B4332)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Result',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff081C15)),
              ),
              SizedBox(height: 20),
              Card(
                color: Color(0xff2D6A4F),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        result,
                        style: TextStyle(color: resultColor, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(color: Color(0xffD8F3DC), fontSize: 60, fontWeight: FontWeight.bold, fontFamily: 'Monsterrat'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffD8F3DC), fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff081C15),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffD8F3DC)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
