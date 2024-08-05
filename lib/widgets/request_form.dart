import 'package:api_client/state/request_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/request_model.dart';
import '../services/http_service.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  final _formKey = GlobalKey<FormState>();
  String _url = '';
  String _method = 'GET';
  final HttpService _httpService = HttpService();

  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'URL'),
              onSaved: (value) => _url = value ?? '',
            ),
            DropdownButtonFormField<String>(
              value: _method,
              items: ['GET', 'POST', 'PUT', 'DELETE']
                  .map((method) => DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _method = value!),
            ),
            ElevatedButton(
                onPressed: _sendRequest, child: const Text('Send Request')),
          ],
        ));
  }

  void _sendRequest() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final request = RequestModel(url: _url, method: _method);
      _httpService.sendRequest(request).then((response) {
        context.read<RequestState>().setResponse(response);
      }).catchError((error) {
        // Handle the error
        print('Error: $error');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $error')));
      });
    }
  }
}
