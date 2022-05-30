import 'package:booker/view_model/pdf_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends GetWidget<PdfViewModel> {
  PdfView({Key? key, required this.url, required this.name}) : super(key: key) {
    controller.url = url;
    controller.getClosePageNumber(name);
  }
  final String url, name;
  // ignore: annotate_overrides
  final controller = Get.put(PdfViewModel());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.saveClosePage(name);
        Get.back();
        return false;
      },
      child: GetBuilder<PdfViewModel>(
          builder: (cont) => Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        controller.saveClosePage(name);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
                body: SfPdfViewer.network(
                  cont.url!,
                  controller: cont.pdfViewerController,
                  onDocumentLoaded: (details) {
                    cont.jumpToColsePage();
                  },
                ),
              )),
    );
  }
}
