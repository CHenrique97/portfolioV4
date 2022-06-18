import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Map<String,String> data;
  const Screen({required this.data, Key? key }) : super(key: key); 

  
  @override
  Widget build(BuildContext context) {
    return 
       Image.network(
        data["thumbnail"].toString(),
        loadingBuilder : (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 220,
                      width: 220,
                      child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
       height:220
      );

} }