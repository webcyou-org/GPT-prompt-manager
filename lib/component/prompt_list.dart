import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/db/database_helper.dart';

class PromptList extends ConsumerStatefulWidget {
  const PromptList({Key? key}) : super(key: key);

  @override
  PromptListState createState() => PromptListState();
}

class PromptListState extends ConsumerState<PromptList> {
  @override
  Widget build(BuildContext context) {
    final promptListData = ref.watch(promptList);
    return Container(
        child: promptListData.when(
      data: (data) {
        return RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) =>
                  _promptItem(data[index]),
            ));
      },
      error: (error, s) {},
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }

  Widget _promptItem(dynamic prompt) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 60),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xffD6D6D6)))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
              ),
              Text(
                prompt.title,
                style:
                    const TextStyle(color: Color(0xff374151), fontSize: 18.0),
              ),
            ],
          )),
      onTap: () {
        // _onClickPrompt(prompt);
      },
    );
  }
}
