import 'package:flutter/material.dart';
class CategorieCard extends StatelessWidget {
  
  final String title;
  final String image;

  const CategorieCard({
    Key? key ,
    required this.title ,
     required this.image
    }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    
    return Padding(
      
        padding: const EdgeInsets.only(right: 8.0 , left: 8.0),
      child: InkWell(
        
        onTap: (){},
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0)
              ),
              height:MediaQuery.of(context).size.height * 0.08 ,
              width: MediaQuery.of(context).size.width * 0.2, 
              child:Image(image: AssetImage(image)) ,
            ),
            Padding(
              padding:const EdgeInsets.only(top: 8.0) ,
              child: Text(title , style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 10 ),),
            )
          ],
        ),
      ) ,
    );
  }
}
