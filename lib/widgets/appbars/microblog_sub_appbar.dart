import 'package:flutter/material.dart';
import 'package:openwykop/widgets/widgets.dart';

class MicroblogSubAppbar extends StatefulWidget {

  final String sort;
  final int hotLastUpdate;
  final Function(String sort, int? lastUpdate, String? archive)? onChangeProperty;

  final Map<String, String> sortTypes = {
    'newest': 'Najnowsze',
    'active': 'Aktywne',
    'hot': 'Gorące',
  };

  MicroblogSubAppbar({
    super.key,
    this.sort = 'hot',
    this.hotLastUpdate = 2,
    this.onChangeProperty,
  });

  @override
  State<MicroblogSubAppbar> createState() => _MicroblogSubAppbarState();
}

class _MicroblogSubAppbarState extends State<MicroblogSubAppbar> {

  List<String> sortList = [];
  String currentSort = 'hot';
  int currentHotLastUpdate = 2;

  @override
  void initState () {
    super.initState();

    sortList = widget.sortTypes.keys.toList();

    currentSort = widget.sort;
    currentHotLastUpdate = widget.hotLastUpdate;
  }

  void _changeSort (String newSort) {
    setState(() {
      currentSort = newSort;
    });

    _onChangeProperty();
  }

  void _changeHotLastUpdate (int newLastUpdate) {
    setState(() {
      currentHotLastUpdate = newLastUpdate;
    });

    _onChangeProperty();
  }

  void _openChangeSortDialog (BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Zmień sortowanie', style: Theme.of(context).textTheme.titleLarge),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: sortList.map((sortType) => InkWell(
                onTap: () {
                  _changeSort(sortType);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(widget.sortTypes[sortType] ?? '', 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: sortType == currentSort ? FontWeight.bold : FontWeight.normal,
                    )
                  )
                )
              )).toList(),
            ),
          )
        );
      }
    );
  }

  List<Widget> _getLeftSideButtons (BuildContext context, String sort) {
    List<Widget> leftSideButtons = [];

    if (widget.sortTypes[sort] == null) {
      return leftSideButtons;
    }

    leftSideButtons.add(SubAppbarButton(label: widget.sortTypes[sort]!, isDropdown: true, onTap: () => _openChangeSortDialog(context)));

    return leftSideButtons;
  }

  List<Widget> _getRightSideButtons (BuildContext context, String sort, int lastUpdate) {
    List<Widget> rightSideButtons = [];

    if (widget.sortTypes[sort] == null) {
      return rightSideButtons;
    }

    if (sort != 'hot') {
      return rightSideButtons;
    }

    rightSideButtons.add(SubAppbarButton(label: '2h', isActive: currentHotLastUpdate == 2, onTap: () => _changeHotLastUpdate(2)));
    rightSideButtons.add(SubAppbarButton(label: '6h', isActive: currentHotLastUpdate == 6, onTap: () => _changeHotLastUpdate(6)));
    rightSideButtons.add(SubAppbarButton(label: '12h', isActive: currentHotLastUpdate == 12, onTap: () => _changeHotLastUpdate(12)));
    rightSideButtons.add(SubAppbarButton(label: '24h', isActive: currentHotLastUpdate == 24, onTap: () => _changeHotLastUpdate(24)));

    return rightSideButtons;
  }

  void _onChangeProperty() {
    if (widget.onChangeProperty == null) {
      return;
    }

    widget.onChangeProperty!(currentSort, currentHotLastUpdate, null);
  }

  @override
  Widget build(BuildContext context) {
    return SubAppbar(
      leftSideButtons: _getLeftSideButtons(context, currentSort), 
      rightSideButtons: _getRightSideButtons(context, currentSort, currentHotLastUpdate),
    );
  }
}



