

import 'dart:developer';

import 'package:flutter_mvvm_tutorial/model/picsum_model.dart';
import 'package:flutter_mvvm_tutorial/services/service.dart';

class ListPictureViewModel{

  List<PictureViewModel>? pictures;


  Future<void> fetchPictures() async {
    final apiResult = await Service().fectchPicturesAPI();

    this.pictures = apiResult.map((e) => PictureViewModel(e)).toList();

  }

}

class PictureViewModel{
  final PicSumModel? picSumModel;

  //생성자
  PictureViewModel(this.picSumModel);
}