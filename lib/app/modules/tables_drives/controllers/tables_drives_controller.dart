import 'package:dio/dio.dart';
import 'package:fehu_app/app/data/models/table_model/table_model.dart';
import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../data/models/table_model/table.dart';
import '../../../data/providers/retrofit.dart';
import '../../../widgets/dialogs.dart';

class TablesDrivesController extends GetxController {
  RestClient client = RestClient(Dio(
      BaseOptions(headers: Constants().headers, baseUrl: Constants.baseUrl)));

  final AppServices appServices = Get.find<AppServices>();

  @override
  onInit() {
    fetchTable();
    super.onInit();
  }

  RxBool isTableLoading = RxBool(false);
  RxList<Table> tableData = <Table>[].obs;
  fetchTable() async {
    isTableLoading.value = true;
    TableModel response;
    try {
      response = await client.getTable(appServices.userId!.value);
      if (response.status == 200) {
        isTableLoading.value = false;
        tableData.value = response.table!;
      } else {
        isTableLoading.value = false;
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      isTableLoading.value = false;
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = TableModel.fromJson(e.response!.data);
          if (response.status == 200) {
            errorGetBar('${response.message}');
          } else {
            errorGetBar('حدث خطأ غير متوقع\nأعد المحاولة مرة اخرى');
          }
          break;
        default:
          errorGetBar('${e.error}');
          break;
      }
    }
  }
}
