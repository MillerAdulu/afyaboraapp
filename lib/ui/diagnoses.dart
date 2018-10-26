import 'package:flutter/material.dart';

import 'package:afyabora/utils/api.dart';
import 'package:afyabora/models/diagnoses/diagnosis.dart';

class Diagnoses extends StatefulWidget {
  @override
  _DiagnosesState createState() => _DiagnosesState();
}

class _DiagnosesState extends State<Diagnoses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Diagnosis>>(
        future: api.getDiagnoses(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text('Diagnosis'),
                            subtitle: Text('${snapshot.data[index].diagnosis}'),
                          ),
                          ListTile(
                            title: Text('Dosage'),
                            subtitle: Text('${snapshot.data[index].dosage}'),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addDiagnosis,
      ),
    );
  }
  void _addDiagnosis() {
    Navigator.pushNamed(context, '/adddiagnosis');
  }
}
