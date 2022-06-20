import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goals_controller.dart';

class GoalsView extends GetView<GoalsController> {
  const GoalsView({Key? key}) : super(key: key);

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
              const SizedBox(height: 15),
              Text(
                '''
تطوير وتحديث البرامج والمقررات الدراسية والأساليب التعليمية

تطوير منظومة دعم الطلاب والخريجين

التقويم المستمر للعملية التعليمية وتقييم فعاليتها

تطوير القدرات والمهارات لأعضاء هيئة التدريس ومعاونيهم ومعايير لتقييم الأداء

تطوير الموارد المالية والمادية والبشرية للكلية

تطوير وتحديث النظام الإدارى بالكلية

تعميق استخدام تكنولوجيا المعلومات في العملية التعليمية

تطوير االمهارات للقيادات الأكاديمية والإدارية بالكلية

تطوير البحث العلمي والدراسات العليا

التنمية التبادلية للمشاركة المجتمعية والارتباط المستمر بأصحاب المصلحة

الإعداد للإعتماد

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
