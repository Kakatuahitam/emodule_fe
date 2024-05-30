import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:emodule_fe/common/styles.dart';
import 'package:emodule_fe/common/constants.dart';
import 'package:emodule_fe/common/utils.dart';
import 'package:emodule_fe/common/nav_helper.dart';
import 'package:emodule_fe/common/custom_pager.dart';

import 'package:emodule_fe/presentation/widget/s/app_drawer.dart';
import 'package:emodule_fe/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:emodule_fe/data/source/data_sources.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:data_table_2/data_table_2.dart';

class StudentsDashboardPageSmall extends StatefulWidget {
  static String route = "/";
  const StudentsDashboardPageSmall({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentsDashboardPageSmall> createState() => _StudentsDashboardPageSmallState();
}

List<Student> _students = <Student>[
  Student(
    'user-a3Vh74XC0xsJelm8_kTX3',
    '109',
    'Yuda Kurnia',
    'Nurul Fikri',
    '106@gmail.com',
    '2024-01-29T00:03:52.905Z',
    '2024-01-29T00:03:52.905Z',
    'active',
  ),
];

// loop result data


_showSnackbar(BuildContext context, String text, [Color? color]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    duration: const Duration(seconds: 1),
    content: Text(text),
  ));
}

int _selectedCount = 0;

class StudentDataSource extends DataTableSource {
  StudentDataSource.empty(this.context) {
    students = [];
  }

  StudentDataSource(this.context, this.students,
      [sortedByCalories = false,
      this.hasRowTaps = false,
      this.hasRowHeightOverrides = false,
      this.hasZebraStripes = false]) {
    students = this.students;
    // if (sortedByCalories) {
    //   sort((d) => d.calories, true);
    // }
  }

  final BuildContext context;
  late List<Student> students;
  // Add row tap handlers and show snackbar
  bool hasRowTaps = false;
  // Override height values for certain rows
  bool hasRowHeightOverrides = false;
  // Color each Row by index's parity
  bool hasZebraStripes = false;

  void sort<T>(Comparable<T> Function(Student s) getField, bool ascending) {
    students.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  void updateSelectedDesserts(RestorableDessertSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < students.length; i += 1) {
      var student = students[i];
      if (selectedRows.isSelected(i)) {
        student.selected = true;
        _selectedCount += 1;
      } else {
        student.selected = false;
      }
    }
    notifyListeners();
  }

  @override
  DataRow2 getRow(int index, [Color? color]) {
    final format = NumberFormat.decimalPercentPattern(
      locale: 'en',
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= students.length) throw 'index > _desserts.length';
    final student = students[index];
    return DataRow2.byIndex(
      index: index,
      selected: student.selected,
      color: color != null
          ? MaterialStateProperty.all(color)
          : (hasZebraStripes && index.isEven
              ? MaterialStateProperty.all(Theme.of(context).highlightColor)
              : null),
      onSelectChanged: (value) {
        if (student.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          student.selected = value;
          notifyListeners();
        }
      },
      onTap: hasRowTaps
          ? () => _showSnackbar(context, 'Tapped on row ${student.firstName}')
          : null,
      onDoubleTap: hasRowTaps
          ? () => _showSnackbar(context, 'Double Tapped on row ${student.firstName}')
          : null,
      onLongPress: hasRowTaps
          ? () => _showSnackbar(context, 'Long pressed on row ${student.firstName}')
          : null,
      onSecondaryTap: hasRowTaps
          ? () => _showSnackbar(context, 'Right clicked on row ${student.firstName}')
          : null,
      onSecondaryTapDown: hasRowTaps
          ? (d) =>
              _showSnackbar(context, 'Right button down on row ${student.firstName}')
          : null,
      // specificRowHeight:
      //     hasRowHeightOverrides && student.lastName >= 25 ? 100 : null,
      cells: [
        DataCell(Text(student.firstName)),
        DataCell(Text(student.lastName)),
        DataCell(Text(student.username)),
        DataCell(Text(student.email)),
        DataCell(Text(student.accountCreated)),
        DataCell(Text(student.lastEdit)),
        DataCell(Text(student.status)),
      ],
    );
  }

  @override
  int get rowCount => students.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final student in students) {
      student.selected = checked ?? false;
    }
    _selectedCount = (checked ?? false) ? students.length : 0;
    notifyListeners();
  }
}

class _StudentsDashboardPageSmallState extends State<StudentsDashboardPageSmall> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int? _sortColumnIndex;
  late StudentDataSource _studentDataSource;
  bool _initialized = false;
  PaginatorController? _controller;


  // List<Student> _studentsss = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (!_initialized) {
      // bloc = DashboardCubit;
      // final _resp = await context.read<DashboardCubit>().getStudentsList();

      // if (state is StudentsListRetrieved) {
      //
      // }

      // print(_resp);
      // final _response = state.studentsListData;

      // List data = _response["result"];
      // example = context.read<DashboardCubit>()..add(getStudentsList);

      Future.delayed(Duration.zero, () async {
        var _resp = await context.read<DashboardCubit>().getStudentsList();
        // print(_resp);
        // print(state);
      });


      // _studentDataSource = StudentDataSource(
      //     context, _studentsss, getCurrentRouteOption(context) == defaultSorting);

      _controller = PaginatorController();

      if (getCurrentRouteOption(context) == defaultSorting) {
        _sortColumnIndex = 1;
      }
      _initialized = true;
    }
  }

  void sort<T>(
    Comparable<T> Function(Student s) getField,
    int columnIndex,
    bool ascending,
  ) {
    _studentDataSource.sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  void dispose() {
    _studentDataSource.dispose();
    super.dispose();
  }

  List<DataColumn> get _columns {
    return [
      DataColumn2(
        size: ColumnSize.L,
        label: const Text('Nama Depan'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.firstName, columnIndex, ascending),
      ),
      DataColumn2(
        size: ColumnSize.L,
        label: const Text('Nama Belakang'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.lastName, columnIndex, ascending),
      ),
      DataColumn2(
        size: ColumnSize.S,
        label: const Text('Username'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.username, columnIndex, ascending),
      ),
      DataColumn2(
        size: ColumnSize.M,
        label: const Text('Email'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.email, columnIndex, ascending),
      ),
      DataColumn2(
        size: ColumnSize.M,
        label: const Text('Akun Dibuat'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.accountCreated, columnIndex, ascending),
      ),
      DataColumn2(
        size: ColumnSize.M,
        label: const Text('Terakhir Diubah'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.lastEdit, columnIndex, ascending),
      ),
      DataColumn2(
        size: ColumnSize.M,
        label: const Text('Status'),
        onSort: (columnIndex, ascending) =>
        sort<String>((s) => s.status, columnIndex, ascending),
      ),
    ];
  }


  // put it here so it can be recreated
  @override
  Widget build(BuildContext context) {
    bool buttonEnabled = true;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: SizedBox(
          height: 100.0,
          // child: Image.asset('images/icons/pramukajaksel.png', width: 140)
        ),
      ),
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 400, minWidth: double.infinity, maxHeight: 800),
              decoration: BoxDecoration(color: Constant.LS_ECRU_WHITE),
              padding: const EdgeInsets.all(16),
              child: _RetrievedData(),
            ),

            // _GetDataButton(),
          ],
        ),
      ),
    );
  }

  Widget _RetrievedData() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        BlocProvider.of<DashboardCubit>(context).getStudentsList();
        if (state is StudentsListRetrieved) {
          final _response = state.studentsListData;

          List data = _response["result"];
          print(data.runtimeType);

          List<Student> _studentsss = data.map((dynamic item) {
            return Student(
              item['id'],
              item['username'],
              item['firstName'],
              item['lastName'],
              item['email'],
              item['accountCreated'],
              item['lastEdit'],
              item['status'],
            );
          }).toList();

          print(_studentsss);

          _studentDataSource = StudentDataSource(
            context, _studentsss, getCurrentRouteOption(context) == defaultSorting);

          return _StudentsTable();

        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(width: 200),
          );
        }
      }
    );
  }

  Widget _GetDataButton() {
    return ElevatedButton(
      onPressed: () async {
        // BlocProvider.of<DashboardCubit>(context).getStudentsList();
        final data = await context.read<DashboardCubit>().getStudentsList();
        // print(data);
        print("ok");
      },

      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder()
      ),
      child: Text('Get Data', style: ThemeText.standardFormFieldP),
    );
  }

  Widget _StudentsTable() {
    // print(data);
    return Stack(alignment: Alignment.bottomCenter, children: [
      PaginatedDataTable2(
        availableRowsPerPage: const [2, 5, 10, 30, 100],
        horizontalMargin: 20,
        checkboxHorizontalMargin: 12,
        columnSpacing: 0,
        wrapInCard: true,
        renderEmptyRowsInTheEnd: false,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
        header:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Daftar Akun - SD Islam Pembangunan'),
          if (kDebugMode && getCurrentRouteOption(context) == custPager)
            Row(children: [
              OutlinedButton(
                  onPressed: () => _controller!.goToPageWithRow(25),
                  child: const Text('Go to row 25')),
              OutlinedButton(
                  onPressed: () => _controller!.goToRow(5),
                  child: const Text('Go to row 5'))
            ]),
          if (getCurrentRouteOption(context) == custPager &&
              _controller != null)
            PageNumber(controller: _controller!)
        ]),
        rowsPerPage: _rowsPerPage,
        autoRowsToHeight: getCurrentRouteOption(context) == autoRows,
        minWidth: 1200.0,
        fit: FlexFit.tight,
        border: TableBorder(
            top: const BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.grey[300]!),
            left: BorderSide(color: Colors.grey[300]!),
            right: BorderSide(color: Colors.grey[300]!),
            verticalInside: BorderSide(color: Colors.grey[300]!),
            horizontalInside: const BorderSide(color: Colors.grey, width: 1)),
        onRowsPerPageChanged: (value) {
          // No need to wrap into setState, it will be called inside the widget
          // and trigger rebuild
          //setState(() {
          _rowsPerPage = value!;
          print(_rowsPerPage);
          //});
        },
        initialFirstRowIndex: 0,
        onPageChanged: (rowIndex) {
          print(rowIndex / _rowsPerPage);
        },
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
        sortArrowAnimationDuration:
            const Duration(milliseconds: 0), // custom animation duration
        onSelectAll: _studentDataSource.selectAll,
        controller:
            getCurrentRouteOption(context) == custPager ? _controller : null,
        hidePaginator: getCurrentRouteOption(context) == custPager,
        columns: _columns,
        empty: Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey[200],
                child: const Text('No data'))),
        source: getCurrentRouteOption(context) == noData
            ? StudentDataSource.empty(context)
            : _studentDataSource,
      ),
      if (getCurrentRouteOption(context) == custPager)
        Positioned(bottom: 16, child: CustomPager(_controller!))
    ]);
  }

  Widget _Placeholder(width, height, border) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: Colors.white,
      ),
    );
  }
}
