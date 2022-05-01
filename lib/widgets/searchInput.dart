import 'package:flutter/material.dart';

class AutocompleteSearchBar extends StatelessWidget {
  const AutocompleteSearchBar(
      {Key? key, required this.searchText, required this.updateSearchText})
      : super(key: key);
  final String searchText;
  final void Function(String value) updateSearchText;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        textEditingController.addListener(() {
          updateSearchText(textEditingController.text);
        });
        return SearchInput(
          searchText: searchText,
          updateSearchText: updateSearchText,
          controller: textEditingController,
        );
      },
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable.empty();
        }
        return [""].where((element) =>
            element.startsWith(textEditingValue.text.toLowerCase()));
      },
    );
  }
}
class SearchInput extends StatelessWidget {
  const SearchInput(
      {Key? key,
        required this.searchText,
        required this.updateSearchText,
        required this.controller})
      : super(key: key);

  final String searchText;
  final void Function(String value) updateSearchText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.onPrimaryContainer;
    Color foreground = Theme.of(context).colorScheme.onPrimary;
    TextStyle textStyle = TextStyle(
      fontSize: 18,
      color: Theme.of(context).colorScheme.onSecondary,
    );
    return Container(
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        style: textStyle,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.onSecondary,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Type your location..",
          contentPadding: EdgeInsets.zero,
          hintStyle: textStyle,
          prefixIcon: searchText.isNotEmpty
              ? IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: Icon(
              Icons.arrow_back,
              color: foreground,
            ),
          )
              : Icon(
            Icons.search,
            color: foreground,
          ),
          suffixIcon: searchText.isNotEmpty
              ? IconButton(
            color: foreground,
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              controller.clear();
            },
          )
              : IconButton(
            color: foreground,
            icon: const Icon(
              Icons.mic,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
