import 'package:bdjobs_test/details_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> _ages = List<int>.generate(100, (index) => index + 1);

  int? _selectedAge;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;

  late TextEditingController _controller;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formatDate(_selectedDate));
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    if (context == null) {
      throw FlutterError('No valid root navigator context found');
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page_1"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 194, 170, 10),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100), bottomRight: Radius.circular(100)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  Text(
                    "Book Name",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Book Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Publisher Name",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Publisher Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Text("Publisher Age",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 15,
                  ),
                  DropdownButton<int>(
                    value: _selectedAge,
                    hint: Text('Select Age'),
                    items: _ages.map((int age) {
                      return DropdownMenuItem<int>(
                        value: age,
                        child: Text('$age'),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedAge = newValue;
                      });
                    },
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Page No",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, right: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Page No',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Publish Date",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Select date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Books Type",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked1,
                          onChanged: (value) {
                            setState(() {
                              isChecked1 = value!;
                            });
                          },
                        ),
                        Text("Sci-fi"),
                        Checkbox(
                          value: isChecked2,
                          onChanged: (value) {
                            setState(() {
                              isChecked2 = value!;
                            });
                          },
                        ),
                        Text("Drama"),
                        Checkbox(
                          value: isChecked3,
                          onChanged: (value) {
                            setState(() {
                              isChecked3 = value!;
                            });
                          },
                        ),
                        Text("Novel"),
                        Checkbox(
                          value: isChecked4,
                          onChanged: (value) {
                            setState(() {
                              isChecked4 = value!;
                            });
                          },
                        ),
                        Text("Fiction"),
                        Checkbox(
                          value: isChecked5,
                          onChanged: (value) {
                            setState(() {
                              isChecked5 = value!;
                            });
                          },
                        ),
                        Text("Poem"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
