
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tutorial/view_model/list_picture_viewmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ListPictureViewModel listPictureViewModel = ListPictureViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('pictures'),),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: const CircularProgressIndicator(),);
          } else {
            return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.blue,
                  child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                      image: '${listPictureViewModel.pictures![index].picSumModel!.downloadUrl}',fit: BoxFit.cover,),
                ),
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count(2, index.isEven ? 2:1 ),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,);
          }
        },

      ),


    );
  }
}
