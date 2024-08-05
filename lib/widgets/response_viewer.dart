import 'package:api_client/state/request_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponseViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RequestState>(
      builder: (context, requestState, child) {
        final response = requestState.response;
        if (response == null) {
          return const Center(child: Text('No response yet'));
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status Code: ${response.statusCode}'),
                    SizedBox(height: 8),
                    Text('Headers:'),
                    Text(response.headers.toString()),
                    SizedBox(height: 8),
                    Text('Body:'),
                    Text(response.body),
                  ]),
            ),
          );
        }
      },
    );
  }
}
