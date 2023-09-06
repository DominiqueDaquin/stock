import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Mangatheque",style: TextStyle(color: Colors.white),),),
backgroundColor: Colors.black,

      ),
      body: Container(
        child: ResponsiveGridList(
          minItemWidth: MediaQuery.of(context).size.width*0.4,
          horizontalGridMargin: 30,
          verticalGridMargin: 30,
          children: [
            Container(color: Colors.red,width: 100,height: 100,),
            Container(color: Colors.green,width: 100,height: 100,),
          ],
        ) ,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
    ),
    );
  }
}
