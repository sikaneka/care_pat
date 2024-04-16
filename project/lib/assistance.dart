import 'package:flutter/material.dart';

class Assistance extends StatelessWidget {
  const Assistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistance'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Parameter')),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Values')),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Condition')),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Temperature')),
                    ),
                  ),
                  TableCell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('< 35°C ')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('36.1 - 37.2°C')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('> 38°C ')),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Hypothermia')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Normal')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Fever')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Heart rate')),
                    ),
                  ),
                  TableCell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('<60 beats per minute')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('60-100 beats per minute')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('>100 beats per minute')),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text('Bradycardia (low heart rate)')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Normal')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text('Tachycardia(high heart rate)')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('blood Pressure')),
                    ),
                  ),
                  TableCell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('90/60 mm Hg or less.')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(' 90/60 mm Hg - 120/80 mm Hg ')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('140/90 mm Hg or higher')),
                        ),
                      ],
                    ),
                  ),
                  TableCell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Low bp')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('Normal')),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text('High bp')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
