import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  final logic = Get.put(MainLogic());
  final state = Get.find<MainLogic>().state;

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Obx(() {
              var lastYearValue = state.data[midtermHiringRate][lastYear];
              var twoYearsAgoValue = state.data[midtermHiringRate][twoYearsAgo];
              var threeYearsAgoValue =
                  state.data[midtermHiringRate][threeYearsAgo];
              var unit = state.data[midtermHiringRate]['unit'];
              return EditableItem(
                title: "中途採用\n比率",
                subTitle: '前年度/2年度前\n/3年度前',
                value:
                    '$lastYearValue$unit$twoYearsAgoValue$unit$threeYearsAgoValue$unit',
                onTap: logic.editMidtermHiringRate,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var lastYearValue = state.data[midtermHiringRate2][lastYear];
              var twoYearsAgoValue =
                  state.data[midtermHiringRate2][twoYearsAgo];
              var threeYearsAgoValue =
                  state.data[midtermHiringRate2][threeYearsAgo];
              var unit = state.data[midtermHiringRate2]['unit'];
              return EditableItem(
                title: "中途採用\n比率2",
                subTitle: '前年度/2年度前\n/3年度前',
                value:
                    '$lastYearValue$unit$twoYearsAgoValue$unit$threeYearsAgoValue$unit',
                onTap: logic.editMidtermHiringRate2,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var value = state.data[averageContinuousServiceYears]['value'];
              var unit = state.data[averageContinuousServiceYears]['unit'];
              return EditableItem(
                title: "正社員の平均継続勤務年数",
                value: '$value$unit',
                onTap: logic.editAverageContinuousServiceYears,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var value = state.data[averageEmployeeAge]['value'];
              var unit = state.data[averageEmployeeAge]['unit'];
              return EditableItem(
                title: "従業員の平均年齢",
                value: '$value$unit',
                onTap: logic.editAverageEmployeeAge,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var value = state.data[monthlyOvertimeHours]['value'];
              var unit = state.data[monthlyOvertimeHours]['unit'];
              return EditableItem(
                title: "月平均所定外労働時間",
                value: '$value$unit',
                onTap: logic.editMonthlyOvertimeHours,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var value = state.data[workersWithOvertime60HoursPlus]['value'];
              var unit = state.data[workersWithOvertime60HoursPlus]['unit'];
              return EditableItem(
                title: "平均の法定時間外労働60時\n間以上の労働者の数",
                textAlign: TextAlign.left,
                value: '$value$unit',
                onTap: logic.editWorkersWithOvertime60HoursPlus,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var value = state.data[childcareLeaveRateMale]['value'];
              var unit = state.data[childcareLeaveRateMale]['unit'];
              return MultipleEditableItem(
                title: "育児休業\n取得率\n（男性）",
                value: value,
                unit: unit,
                onEdit: logic.editChildcareLeaveRateMale,
                onAdd: logic.onAddChildcareLeaveRateMale,
                onRemove: logic.onRemoveChildcareLeaveRateMale,
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              var value = state.data[childcareLeaveRateFemale]['value'];
              var unit = state.data[childcareLeaveRateFemale]['unit'];
              return MultipleEditableItem(
                title: "育児休業\n取得率\n（女性）",
                value: value,
                unit: unit,
                onEdit: logic.editChildcareLeaveRateFemale,
                onAdd: logic.onAddChildcareLeaveRateFemale,
                onRemove: logic.onRemoveChildcareLeaveRateFemale,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class EditableItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String value;
  final VoidCallback onTap;
  final TextAlign? textAlign;

  const EditableItem({
    super.key,
    required this.title,
    this.subTitle,
    required this.value,
    required this.onTap,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffE1E1E1),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            textAlign: textAlign ?? TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 50),
          if (subTitle != null)
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: subTitle == null ? 78 : 110,
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/img.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "images/edit.png",
                      width: 16,
                    ),
                  ),
                  Center(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MultipleEditableItem extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> value;
  final String unit;
  final VoidCallback onAdd;
  final ValueSetter onRemove;
  final ValueSetter<Map> onEdit;

  const MultipleEditableItem({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.onAdd,
    required this.onRemove,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffE1E1E1),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              children: [
                for (var item in value) ...[
                  if (value.indexOf(item) != 0) const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      onEdit(item);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "images/img_2.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  item.keys.first.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '${item.values.first.toString()}$unit',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: -18,
                            top: -16,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                onRemove(item);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "images/delete.png",
                                  width: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (value.indexOf(item) != value.length - 1) ...[
                    const SizedBox(height: 10),
                    const Divider(height: 1, color: Color(0xffE1E1E1))
                  ]
                ],
                if (value.isNotEmpty) const SizedBox(height: 20),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: double.infinity,
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "images/img_2.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        "images/add.png",
                        width: 8,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditDialog extends StatelessWidget {
  final String title;
  final Map<String, dynamic> contentValue;

  const EditDialog({
    super.key,
    required this.title,
    required this.contentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 289,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage(
                "images/dialog_bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title.isNotEmpty) ...[
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                ],
                for (var item in contentValue['value']) ...[_item(item)],
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Get.back(result: contentValue['value']);
                  },
                  child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff007FFF),
                    ),
                    child: const Text(
                      "确定",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _item(Map item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${item['name']}(単位：${contentValue['unit']})",
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Container(
          height: 44,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffF7F7F7)),
          child: TextField(
            controller: TextEditingController(text: item['value'].toString()),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              isDense: true,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              TextInputFormatter.withFunction((oldValue, newValue) {
                try {
                  final int input = int.parse(newValue.text);
                  if (input > 100) {
                    return oldValue;
                  }
                } catch (e) {
                  // Handle error (e.g., parsing error)
                }
                return newValue;
              }),
            ],
            onChanged: (s) {
              contentValue['value'].forEach((element) {
                if (element['name'] == item['name']) {
                  element['value'] = s;
                }
              });
            },
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class MultipleEditDialog extends StatelessWidget {
  final String title;
  final Map<String, dynamic> contentValue;

  const MultipleEditDialog({
    super.key,
    required this.title,
    required this.contentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 289,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage(
                "images/dialog_bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(height: 30),
                _item(contentValue['value'][0], false),
                _item(contentValue['value'][1], true),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Get.back(result: contentValue['value']);
                  },
                  child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff007FFF),
                    ),
                    child: const Text(
                      "确定",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _item(Map item, bool isNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (item['value'] == "") ...[
              const Text(
                "*",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 5),
            ],
            Text(
              "${item['name']}",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          height: 44,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffF7F7F7)),
          child: TextField(
            controller: TextEditingController(text: item['value'].toString()),
            decoration: InputDecoration(
              hintText: '${item['hint']}',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              isDense: true,
            ),
            keyboardType: isNumber ? TextInputType.number : null,
            inputFormatters: [
              if (isNumber) ...[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  try {
                    final int input = int.parse(newValue.text);
                    if (input > 100) {
                      return oldValue;
                    }
                  } catch (e) {
                    // Handle error (e.g., parsing error)
                  }
                  return newValue;
                }),
              ]
            ],
            onChanged: (s) {
              contentValue['value'].forEach((element) {
                if (element['name'] == item['name']) {
                  element['value'] = s;
                }
              });
            },
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
