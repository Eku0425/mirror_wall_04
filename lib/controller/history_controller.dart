import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchEngine extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  RxString search = 'google'.obs;
  RxList<String> searchData = <String>[].obs;
  RxList<String> urlData = <String>[].obs;
  List<String> webData = [];
  RxBool load = false.obs;
  Future<void> setData(String name, String url) async {
    searchData.add(name);
    urlData.add(url);
    final SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setStringList('search', searchData);
    ref.setStringList('url', urlData);
  }

  Future<Object> getData() async {
    searchData.clear();
    final SharedPreferences ref = await SharedPreferences.getInstance();
    //List data =ref.getStringList('search')!;
    if (ref.getStringList('search') != null) {
      searchData.value = ref.getStringList('search')!;
      return searchData;
    } else {
      return 'no data';
    }
  }

  Future<Object> getUrlData() async {
    urlData.clear();
    final SharedPreferences ref = await SharedPreferences.getInstance();
    //List data =ref.getStringList('search')!;
    if (ref.getStringList('url') != null) {
      urlData.value = ref.getStringList('url')!;
      return urlData;
    } else {
      return 'no data';
    }
  }
}
