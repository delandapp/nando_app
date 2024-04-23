import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readism/app/data/constans/endpoint.dart';
import 'package:readism/app/data/models/response_buku.dart';
import 'package:readism/app/data/models/response_kategori.dart';
import 'package:readism/app/data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
class MyState<T1,T2> {
  T1? state1;
  T2? state2;
  MyState({this.state1, this.state2});
}

class HomeController extends GetxController with StateMixin<MyState<List<DataKategori>, List<DataBuku>>>{
  //TODO: Implement HomeController
  final RxString username = StorageProvider.read(StorageKey.username).obs;
    final TextEditingController search = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

   Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        // final idUser = StorageProvider.read(StorageKey.idUser);
         final response = await ApiProvider.instance().get(Endpoint.book,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        // final responseKoleksiData = await ApiProvider.instance().get('${Endpoint.koleksi}/${idUser}',options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        final responseKategoriBuku = await ApiProvider.instance().get(Endpoint.kategori,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        if (responseKategoriBuku.statusCode == 200) {
          // final ResponseBookPopular responseBookPopular = ResponseBookPopular.fromJson(response.data);
          final ResponseBuku responseBook = ResponseBuku.fromJson(response.data);
          final ResponseKategori responseKategori = ResponseKategori.fromJson(responseKategoriBuku.data);
          if(responseKategoriBuku.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            final newData = MyState(state1: responseKategori.data, state2: responseBook.data);
            change(newData, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
