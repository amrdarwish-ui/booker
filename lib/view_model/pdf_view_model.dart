import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewModel extends GetxController {
  PdfViewerController? pdfViewerController;
  GetStorage? getStorage;
  String? url;
  int? pageNumber;
  @override
  void onInit() {
    pdfViewerController = PdfViewerController();
    getStorage = GetStorage();

    super.onInit();
  }

  void getClosePageNumber(String bookName) {
    pageNumber = getStorage!.read(bookName);
    print(pageNumber);
  }

  void jumpToColsePage() {
    if (pageNumber != null) {
      pdfViewerController!.jumpToPage(pageNumber!);
      update();
    }
  }

  void saveClosePage(String bookName) {
    getStorage!.write(bookName, pdfViewerController!.pageNumber);
  }
}
