import 'package:dio/dio.dart';
import '../service/service_url.dart';

Future getAndroidData(int index) async {
  try {
    Response response;
    Dio dio = Dio();
    String url = android + index.toString();
    print('请求Android模块数据url：$url');
    response = await dio.get(url);
    print('请求Android模块数据：${response.data.toString()}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Android请求失败');
    }
  } catch (e) {
    print('请求Android模块数据出错: $e');
  }
}

Future getIosData(int index) async {
  try {
    Response response;
    response = await Dio().get(ios + index.toString());
    print('请求iOS模块数据：${response.data.toString()}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('iOS请求失败');
    }
  } catch (e) {
    print('请求iOS模块数据出错：$e');
  }
}

Future getMeinvData(int index) async {
  try {
    Response response;
    response = await Dio().get(female + index.toString());
    print('请求美女模块数据：${response.data.toString()}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('美女请求失败');
    }
  } catch (e) {
    print('请求美女模块数据出错：$e');
  }
}

Future getXianduCategory() async {
  try {
    Response response;
    response = await Dio().get(xianduCategory);
    print('闲读分类数据：${response.data.toString()}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('闲读分类请求失败');
    }
  } catch (e) {
    print('闲读分类数据出错：$e');
  }
}

Future getXianduCategorySec(String category) async {
  try {
    Response response;
    response = await Dio().get(xianduCategorySec + category);
    print('闲读二级分类数据：${response.data.toString()}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('闲读二级分类请求失败');
    }
  } catch (e) {
    print('闲读二级分类数据出错：$e');
  }
}

Future getXianduData(String id, int index) async {
  try {
    Response response;
    response = await Dio().get(xianduData + "id/$id+count/10/page/${index.toString()}");
    print('闲读数据：${response.data.toString()}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('闲读请求失败');
    }
  } catch (e) {
    print('闲读数据出错：$e');
  }
}
