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
      backgroundColor: Color(0xfffefae0),
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
        backgroundColor: const Color(0xfffefae0),
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
                _buildEditableValueCard('Weight', _weight.toStringAsFixed(1),
                    (value) {
                  setState(() => _weight = double.tryParse(value) ?? _weight);
                }),
                _buildEditableValueCard('Age', '$_age', (value) {
                  setState(() => _age = int.tryParse(value) ?? _age);
                }),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff7f5539),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'CALCULATE',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xffD8F3DC)),
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
        color: isSelected ? Color(0xFFd4a373) : Color(0xFFfaedcd),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 100,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Color(0xffffffff)),
              SizedBox(height: 10),
              Text(gender, style: TextStyle(color: Color(0xffffffff))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderCard(String label, String value, double sliderValue,
      double min, double max, Function(double) onChanged) {
    return Card(
      color: Color(0xFFd4a373),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label,
                style: TextStyle(
                    color: Color(0xffD8F3DC),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins')),
            SizedBox(
              width: 100,
              child: TextFormField(
                initialValue: value,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Color(0xffB7E4C7),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monsterrat'),
                onChanged: (inputValue) {
                  setState(() {
                    double? parsedValue = double.tryParse(inputValue);
                    if (parsedValue != null &&
                        parsedValue >= min &&
                        parsedValue <= max) {
                      _height = parsedValue;
                    }
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffB7E4C7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffD8F3DC)),
                  ),
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            Slider(
              value: sliderValue,
              min: min,
              max: max,
              activeColor: Color(0xfff3d0c3),
              inactiveColor: const Color.fromARGB(255, 44, 63, 45),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableValueCard(
      String label, String value, Function(String) onChanged) {
    return Card(
      color: Color(0xFFd4a373),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(label,
                style: TextStyle(
                    color: Color(0xffD8F3DC),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins')),
            SizedBox(height: 10),
            SizedBox(
              width: 80,
              child: TextFormField(
                initialValue: value,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Color(0xffB7E4C7),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monsterrat'),
                onChanged: onChanged,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffB7E4C7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffD8F3DC)),
                  ),
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
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
      resultColor = const Color.fromARGB(255, 1, 127, 230);
    } else if (bmi < 24.9) {
      result = 'NORMAL';
      message = 'You have a normal body weight. Good job!';
      resultColor = const Color.fromARGB(255, 12, 88, 14);
    } else if (bmi < 29.9) {
      result = 'OVERWEIGHT';
      message = 'Consider exercising more.';
      resultColor = const Color.fromARGB(255, 208, 125, 0);
    } else {
      result = 'OBESE';
      message = 'Seek advice from a healthcare provider.';
      resultColor = const Color.fromARGB(255, 247, 16, 0);
    }

    return Scaffold(
      backgroundColor: Color(0xFFfaedcd),
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color(0xFFd4a373),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfaedcd),
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
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFd4a373)),
              ),
              SizedBox(height: 20),
              Card(
                color: Color(0xFFd4a373),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                            color: resultColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                            color: Color(0xffD8F3DC),
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monsterrat'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD8F3DC), fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7f5539),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD8F3DC)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

