import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
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
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Select date',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }
}
