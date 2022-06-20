import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vision_genesis_controller.dart';

class VisionGenesisView extends GetView<VisionGenesisController> {
  const VisionGenesisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FEHU'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InteractiveViewer(
                child: Image.asset(
                  'assets/images/img2.jpg',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '''
– فى عام 1960 تم عقد اتفاق بين الحكومة المصرية وحكومة ألمانيا الغربية على تأسيس معهد القاهرة العالى للتكنولوجيا بحلوان، وتم إنشاء المبانى الحالية ومد الجانب الألمانى المعهد بالمعدات وأجهزة الورش والمختبرات العملية وقد بدأت الدراسة بهذا المعهد عام 1963

– فى عام 1975 تم ضم معهد القاهرة العالى للتكنولوجيا إلى جامعة حلوان باسم كلية الهندسة والتكنولوجيا بحلوان·

– فى 1996 تغير المسمى إلى كلية الهندسة بحلوان·

رؤية الكليه

مواصلة تقديم البرامج الهندسية المتميزة والمتوافقة مع سوق العمل لتنمية البيئة وخدمة المجتمع من خلال البحث العلمى بما يحقق التنافسية والريادة محليا واقليميا.

رسالة الكليه

تسعى كلية هندسة حلوان إلى إعداد خريجين مؤهلين فى التخصصات الهندسية المختلفة وتزويدهم بالمهارات والمعارف اللازمة لخدمة مؤسسات سوق العمل وأداء واجباتهم المهنية، والإسهام فى التقدم العلمى من خلال برامج الدراسات العليا، إضافة إلى الإرتقاء بالأداء المهنى المطلوب فى جهات العمل من خلال الخدمات الإستشارية والبحوث التطبيقية وبرامج التدريب لتنمية البيئة وخدمة المجتمع محليا واقليميا

''',
                style: TextStyle(
                  fontSize: 20,
                  color: (controller.appServices.isDark.value)
                      ? Colors.white
                      : Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
