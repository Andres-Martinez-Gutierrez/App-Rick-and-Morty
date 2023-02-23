import 'package:flutter/material.dart';
import 'package:pruebatecnica/home/widgets/search_character_delegate.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      onPressed: () {
        showSearch(
          context: context,
          delegate: SearchCharacterDelegate(),
        );
      },
    );
  }
}
