import 'package:get/get.dart';
import 'package:interview_demo/page/main/main_view.dart';

import 'main_state.dart';

const String midtermHiringRate = '中途採用比率';
const String midtermHiringRate2 = '中途採用比率2';
const String averageContinuousServiceYears = '正社員の平均継続勤務年数';
const String averageEmployeeAge = '従業員の平均年齢';
const String monthlyOvertimeHours = '月平均所定外労働時間';
const String workersWithOvertime60HoursPlus = '平均の法定時間外労働60時間以上の労働者の数';
const String childcareLeaveRateMale = '育児休業取得率（男性）';
const String childcareLeaveRateFemale = '育児休業取得率（女性）';
const String lastYear = '前年度';
const String twoYearsAgo = '2年度前';
const String threeYearsAgo = '3年度前';
Map defaultData = {
// Map<String, Map<String, String>> '10%20%30%' 可以编辑
  midtermHiringRate: {
    lastYear: 10,
    twoYearsAgo: 20,
    threeYearsAgo: 30,
    "unit": "%",
  },
  midtermHiringRate2: {
    lastYear: 10,
    twoYearsAgo: 20,
    threeYearsAgo: 30,
    "unit": "%",
  },
// Map<String, String> value(如：'18.5年') 可以编辑
  averageContinuousServiceYears: {'value': 18.5, 'unit': '年'},
  averageEmployeeAge: {'value': 50.5, 'unit': '岁'},
  monthlyOvertimeHours: {'value': 18, 'unit': '時間'},
  workersWithOvertime60HoursPlus: {'value': 15, 'unit': '人'},
// Map<String, List<Map<String, String>>> List<Map<String, String>> 可以编辑，可删除 Map<String, String>，并且可以无限增加 Map<String, String>
  childcareLeaveRateMale: {
    'value': [
      {
        '正社員': 34,
      },
      {
        '専門職': 50,
      },
    ],
    'unit': '%'
  },
  childcareLeaveRateFemale: {
    'value': [
      {
        '正社員': 34,
      },
      {
        '専門職': 50,
      },
    ],
    'unit': '%'
  },
};

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.data.addAll(defaultData);
  }

  void editMidtermHiringRate() {
    Get.dialog(EditDialog(
      title: "中途採用比率",
      contentValue: {
        "unit": "%",
        "value": [
          {
            "name": lastYear,
            "value": state.data[midtermHiringRate][lastYear],
          },
          {
            "name": twoYearsAgo,
            "value": state.data[midtermHiringRate][twoYearsAgo],
          },
          {
            "name": threeYearsAgo,
            "value": state.data[midtermHiringRate][threeYearsAgo],
          },
        ]
      },
    )).then((value) {
      if (value != null) {
        state.data[midtermHiringRate][lastYear] = value[0]['value'];
        state.data[midtermHiringRate][twoYearsAgo] = value[1]['value'];
        state.data[midtermHiringRate][threeYearsAgo] = value[2]['value'];
        state.data.refresh();
      }
    });
  }

  void editMidtermHiringRate2() {
    Get.dialog(EditDialog(
      title: "中途採用比率2",
      contentValue: {
        "unit": "%",
        "value": [
          {
            "name": lastYear,
            "value": state.data[midtermHiringRate2][lastYear],
          },
          {
            "name": twoYearsAgo,
            "value": state.data[midtermHiringRate2][twoYearsAgo],
          },
          {
            "name": threeYearsAgo,
            "value": state.data[midtermHiringRate2][threeYearsAgo],
          },
        ]
      },
    )).then((value) {
      if (value != null) {
        state.data[midtermHiringRate2][lastYear] = value[0]['value'];
        state.data[midtermHiringRate2][twoYearsAgo] = value[1]['value'];
        state.data[midtermHiringRate2][threeYearsAgo] = value[2]['value'];
        state.data.refresh();
      }
    });
  }

  void editAverageContinuousServiceYears() {
    Get.dialog(EditDialog(
      title: "",
      contentValue: {
        "unit": state.data[averageContinuousServiceYears]['unit'],
        "value": [
          {
            "name": averageContinuousServiceYears,
            "value": state.data[averageContinuousServiceYears]['value'],
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        state.data[averageContinuousServiceYears]['value'] = value[0]['value'];
        state.data.refresh();
      }
    });
  }

  void editAverageEmployeeAge() {
    Get.dialog(EditDialog(
      title: "",
      contentValue: {
        "unit": state.data[averageEmployeeAge]['unit'],
        "value": [
          {
            "name": averageEmployeeAge,
            "value": state.data[averageEmployeeAge]['value'],
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        state.data[averageEmployeeAge]['value'] = value[0]['value'];
        state.data.refresh();
      }
    });
  }

  void editMonthlyOvertimeHours() {
    Get.dialog(EditDialog(
      title: "",
      contentValue: {
        "unit": state.data[monthlyOvertimeHours]['unit'],
        "value": [
          {
            "name": monthlyOvertimeHours,
            "value": state.data[monthlyOvertimeHours]['value'],
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        state.data[monthlyOvertimeHours]['value'] = value[0]['value'];
        state.data.refresh();
      }
    });
  }

  void editWorkersWithOvertime60HoursPlus() {
    Get.dialog(EditDialog(
      title: "",
      contentValue: {
        "unit": state.data[workersWithOvertime60HoursPlus]['unit'],
        "value": [
          {
            "name": workersWithOvertime60HoursPlus,
            "value": state.data[workersWithOvertime60HoursPlus]['value'],
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        state.data[workersWithOvertime60HoursPlus]['value'] = value[0]['value'];
        state.data.refresh();
      }
    });
  }

  void editChildcareLeaveRateMale(Map item) {
    Get.dialog(MultipleEditDialog(
      title: childcareLeaveRateMale,
      contentValue: {
        "value": [
          {
            "name": "職種",
            "hint": "職種を入力してください",
            "value": item.keys.first.toString(),
          },
          {
            "name": "割合(単位：%)",
            "hint": "割合を入力してください",
            "value": item.values.first.toString(),
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        List list = state.data[childcareLeaveRateMale]['value'];
        var index = list.indexOf(item);
        list.removeWhere((element) => element.keys.first == item.keys.first);
        list.insert(index, {
          value[0]['value'].toString(): int.parse(value[1]['value']),
        });
        state.data.refresh();
      }
    });
  }

  void onAddChildcareLeaveRateMale() {
    Get.dialog(MultipleEditDialog(
      title: childcareLeaveRateMale,
      contentValue: {
        "value": [
          {
            "name": "職種",
            "hint": "職種を入力してください",
            "value": "",
            "unit": "${state.data[averageContinuousServiceYears]['unit']}}"
          },
          {
            "name": "割合(単位：%)",
            "hint": "割合を入力してください",
            "value": "",
            "unit": "${state.data[averageContinuousServiceYears]['unit']}}"
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        var list = state.data[childcareLeaveRateMale]['value'];
        list.add({
          value[0]['value'].toString(): int.parse(value[1]['value']),
        });
        state.data.refresh();
      }
    });
  }

  void onRemoveChildcareLeaveRateMale(value) {
    state.data[childcareLeaveRateMale]['value'].remove(value);
    state.data.refresh();
  }

  void editChildcareLeaveRateFemale(Map item) {
    Get.dialog(MultipleEditDialog(
      title: childcareLeaveRateFemale,
      contentValue: {
        "value": [
          {
            "name": "職種",
            "hint": "職種を入力してください",
            "value": item.keys.first.toString(),
          },
          {
            "name": "割合(単位：%)",
            "hint": "割合を入力してください",
            "value": item.values.first.toString(),
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        List list = state.data[childcareLeaveRateFemale]['value'];
        var index = list.indexOf(item);
        list.removeWhere((element) => element.keys.first == item.keys.first);
        list.insert(index, {
          value[0]['value'].toString(): int.parse(value[1]['value']),
        });
        state.data.refresh();
      }
    });
  }

  void onAddChildcareLeaveRateFemale() {
    Get.dialog(MultipleEditDialog(
      title: childcareLeaveRateFemale,
      contentValue: {
        "value": [
          {
            "name": "職種",
            "hint": "職種を入力してください",
            "value": "",
            "unit": "${state.data[averageContinuousServiceYears]['unit']}}"
          },
          {
            "name": "割合(単位：%)",
            "hint": "割合を入力してください",
            "value": "",
            "unit": "${state.data[averageContinuousServiceYears]['unit']}}"
          }
        ]
      },
    )).then((value) {
      if (value != null) {
        var list = state.data[childcareLeaveRateFemale]['value'];
        list.add({
          value[0]['value'].toString(): int.parse(value[1]['value']),
        });
        state.data.refresh();
      }
    });
  }

  void onRemoveChildcareLeaveRateFemale(value) {
    state.data[childcareLeaveRateFemale]['value'].remove(value);
    state.data.refresh();
  }
}
