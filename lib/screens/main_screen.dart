import 'package:api_client/widgets/request_form.dart';
import 'package:api_client/widgets/response_viewer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fiesta Client')),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: Center(child: Text('Sidebar - Collections here')),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(child: RequestForm()),
                Expanded(child: ResponseViewer())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
