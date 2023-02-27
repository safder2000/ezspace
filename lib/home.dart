import 'dart:developer';

import 'package:ezspace/application/text_legth_bloc/text_length_bloc.dart';
import 'package:ezspace/core/const_sizedbox.dart';
import 'package:ezspace/infrastrecture/fetch_Job_designations.dart';

import 'package:ezspace/widgets/char_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/home_bloc/home_bloc.dart';
import 'widgets/button.dart';

class HomePage extends StatelessWidget {
  final textController = TextEditingController();

  // int charLength = 0;
  List<String> suggestons = [];

  // _onChanged(String value) {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Spacer(),
            // IconButton(
            //     onPressed: () async {
            //       var list = await JobDesesignationRepo.fetchDesignations();
            //       log(list.toString());
            //     },
            //     icon: Icon(Icons.abc)),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return RawAutocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    } else {
                      BlocProvider.of<HomeBloc>(context)
                          .add(MatchingText(text: textController.text));
                      return context.read<HomeBloc>().state.matchText;
                    }
                  },
                  onSelected: (String selection) {},
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return Container(
                      width: size.width * 0.9,
                      height: size.width * 0.2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            hintText: 'Designation'),
                        controller: textEditingController,
                        focusNode: focusNode,
                        expands: true,
                        maxLines: null,
                        onSubmitted: (String value) {},
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      void Function(String) onSelected,
                      Iterable<String> options) {
                    return Material(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                          height: 200,
                          child: SingleChildScrollView(
                              child: Column(
                            children: options.map((opt) {
                              return InkWell(
                                  onTap: () {
                                    onSelected(opt);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(right: 60),
                                      child: Card(
                                          child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        child: Text(opt),
                                      ))));
                            }).toList(),
                          ))),
                    ));
                  },
                );
              },
            ),
            Container(
              width: size.width * 0.9,
              height: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(200),
                ],
                onChanged: (value) => BlocProvider.of<TextLengthBloc>(context)
                    .add(LenthChanges(newValue: value.length)),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    hintText: 'Describe yourself (in min 50 charecters)'),
              ),
            ),
            BlocBuilder<TextLengthBloc, TextLengthState>(
              builder: (context, state) {
                return CharCount(charLength: state.totalChar);
              },
            ),
            height_50,
            const Button()
          ],
        ),
      ),
    );
  }
}
