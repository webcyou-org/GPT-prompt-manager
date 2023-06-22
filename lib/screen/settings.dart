import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/const.dart';
import '../db/database_helper.dart';

const promptModelList = ['text-davinci-003'];

class Settings extends ConsumerStatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends ConsumerState<Settings> {
  final dbHelper = DatabaseHelper.instance;
  var selectedValue = promptModelList.first;
  final _apiEditController = TextEditingController();

  bool _isObscure = true;
  bool _isConfigTableRow = false;

  @override
  Widget build(BuildContext context) {
    ref.watch(mainDbApikey).when(
          loading: CircularProgressIndicator.new,
          data: (data) => _apiEditController.text = data,
          error: (error, stackTrace) => print('error: $error'),
        );
    ref.watch(isDbApikey).when(
          loading: CircularProgressIndicator.new,
          data: (data) => _isConfigTableRow = data! > 0,
          error: (error, stackTrace) => print('error: $error'),
        );

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: titleText('Model')),
            SizedBox(
                width: 256,
                height: 36,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff424242)),
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: DropdownButton(
                          isExpanded: true,
                          value: selectedValue,
                          underline: Container(),
                          items: promptModelList
                              .map((String list) => DropdownMenuItem(
                                  value: list,
                                  child: Text(
                                    list,
                                  )))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return promptModelList.map((String value) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  selectedValue,
                                  style:
                                      const TextStyle(color: Color(0xff424242)),
                                ),
                              );
                            }).toList();
                          },
                        )))),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: titleText('OpenAI API Key')),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                    child: TextFormField(
                  controller: _apiEditController,
                  obscureText: _isObscure,
                  decoration: secretInputDecoration(
                      'Enter the secret key for the open ai api here and save it locally',
                      _isObscure, (() {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  })),
                  style: inputTextStyle(),
                ))),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(80, 40),
                        backgroundColor: const Color(0xFF5E47D2),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        if (_isConfigTableRow) {
                          Map<String, dynamic> row = {
                            DatabaseHelper.columnId: 1,
                            'apikey': _apiEditController.text
                          };
                          await dbHelper.update(userTableName, row);
                        } else {
                          Map<String, dynamic> row = {
                            'apikey': _apiEditController.text
                          };
                          await dbHelper.insert(userTableName, row);
                        }
                      },
                      child: const Text('Save'),
                    ))),
          ])),
    );
  }
}
