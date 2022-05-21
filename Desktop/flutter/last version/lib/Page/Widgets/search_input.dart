import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    // final widthSearchBar = width*0.1;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0 , vertical: 5 ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
          
            width : 13,
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a doctor',
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    
                ),
                  disabledBorder:InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
