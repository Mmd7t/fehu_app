import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/organizational_chart_controller.dart';

class OrganizationalChartView extends GetView<OrganizationalChartController> {
  const OrganizationalChartView({Key? key}) : super(key: key);

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
                  'assets/images/img1.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '''
یمثل الهیكل التنظیمى الوعاء الذى تمارس من خلاله الكلیة نشاطها لتحقیق أهدافها، ویشمل الهیكل التنظیمى للكلیة كافة عملیات تجمیع وتصنیف وتقسیم للأنشطة فى شكل إدارات وأقسام ووحدات، وتحدید

المستویات الإداریة، وتحدید علاقات السلطة على المستوى الراسى فى الهرم التنظیمى، والاختصاصات و المسؤولیات والأدوار، وخطوط الاتصال، وتدفق المعلومات

    تم اعتماد الهیكل التنظیمى للكلیة من مجلس الكلیة فى 19/6/2010 ثم اعید تحدیثه فى ضوء معاییر الجودة والاعتماد وبعد إنشاء عدد من الوحدات الجدیدة وتم اعتماده من مجلس الكلیة مرة اخرى فى 18/7/2010. وكان الاعتماد النهائى بعد آخر تحدیث له فى جلسة مجلس الكلیة رقم 382 بتاريخ 10/10/2011. والشكل التالى یعبر عن الخریطة التنظیمیة لهذا الهیكل بعد آخر تحدیث له

قواعد تعيين أعضاء هيئة التدريس والهيئة المعاونة بالكلية :

قواعد تعيين أعضاء هيئة التدريس تتم وفقاُ للقانون رقم 49 لسنة 1972 بشأن تنظيم الجامعات المصرية

أما بالنسبة للهيئة المعاونة لأعضاء هيئة التدريس فتسرى عليهم أحكام بعض مواد هذا القانون كما تسرى عليهم أحكام العاملين من غير أعضاء هيئة التدريس فيما لم يرد فى شأنة نص خاص بهم

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
