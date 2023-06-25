import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_manager/component/message_list.dart';
import 'package:prompt_manager/component/home_text_form_field.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        children: const [
                          MessageList(),
                        ],
                      )))),
          Positioned(
            left: 80,
            bottom: 30,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: SizedBox(
                    width: size.width * 0.8 - 40,
                    child: const HomeTextFormField())),
          )
        ],
      ),
    );
  }
}
